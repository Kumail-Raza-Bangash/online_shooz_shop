import 'package:flutter/material.dart';
import 'package:flutter_video_card_practice/provider/video_provider.dart';
import 'package:flutter_video_card_practice/resources/colors.dart';
import 'package:flutter_video_card_practice/resources/dimensions.dart';
import 'package:flutter_video_card_practice/widgets/custom_loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CustomCardWidget extends StatefulWidget {
  final String videoPath;
  final String name;
  final bool isVip;

  const CustomCardWidget({
    super.key,
    required this.videoPath,
    required this.name,
    this.isVip = false,
  });

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  late VideoProvider _videoProvider;

  @override
  void initState() {
    super.initState();
    _videoProvider = VideoProvider();
    _videoProvider.initializeVideo(widget.videoPath);
  }

  @override
  void dispose() {
    _videoProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _videoProvider,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.radius10),
          ),
          child: Stack(
            children: [
              Consumer<VideoProvider>(
                builder: (context, videoProvider, child) {
                  return FutureBuilder(
                    future: videoProvider.initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: videoProvider
                                  .videoController.value.size.width,
                              height: videoProvider
                                  .videoController.value.size.height,
                              child: VideoPlayer(videoProvider.videoController),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CustomLoadingWidget(),
                        );
                      }
                    },
                  );
                },
              ),
              if (widget.isVip && widget.name == "VIP")
                Positioned(
                  top: 10,
                  right: 10,
                  child: _buildVipIcon(),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVipIcon() {
    return Container(
      height: Dimensions.height20,
      width: Dimensions.width30 * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius05),
        color: AppColor.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'VIP',
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: Dimensions.font15,
            ),
          ),
          const SizedBox(width: 7.0),
          Image.asset(
            'assets/icons/vip-crown.png', // Adjust the path
            width: Dimensions.width30 / 2, // Set width as needed
            height: Dimensions.height30 / 2, // Set height as needed
            color: AppColor.whiteColor,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomText() {
    String localizedName = widget.name;

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.width10),
        child: Center(
          child: Text(
            localizedName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.font15,
            ),
          ),
        ),
      ),
    );
  }
}
