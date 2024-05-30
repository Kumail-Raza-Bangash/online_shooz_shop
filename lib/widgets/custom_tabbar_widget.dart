import 'package:flutter/material.dart';
import 'package:flutter_video_card_practice/provider/tab_provider.dart';
import 'package:flutter_video_card_practice/resources/colors.dart';

import 'package:provider/provider.dart';

class CustomTabbarWidget extends StatefulWidget {
  const CustomTabbarWidget({super.key});

  @override
  State<CustomTabbarWidget> createState() => _CustomTabbarWidgetState();
}

class _CustomTabbarWidgetState extends State<CustomTabbarWidget> {
  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return DefaultTabController(
      length: 5, // Number of tabs
      initialIndex: tabProvider.currentIndex,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(child: Text("All")),
              Tab(child: Text("VIP")),
              Tab(child: Text("NEW")),
              Tab(child: Text("TRENDING")),
              Tab(child: Text("FEATURE")),
            ],
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColor.blackColor,
                  width: 3.0,
                ),
              ),
            ),
            isScrollable: true,
            labelColor: AppColor.blackColor,
            unselectedLabelColor: AppColor.greyColor,
            onTap: (index) {
              tabProvider.setTabIndex(index);
            },
          ),
        ],
      ),
    );
  }
}
