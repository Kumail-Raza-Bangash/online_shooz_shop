import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/app_style.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child: Stack(
          children: [
            // TopText
            Container(
              height: Dimensions.screenHeight * 0.4,
              width: Dimensions.screenWidth,
              padding: EdgeInsets.fromLTRB(
                0,
                Dimensions.height30,
                0,
                0,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  Dimensions.width10,
                  Dimensions.height10,
                  Dimensions.width05,
                  Dimensions.height10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Athletics Shoes ",
                      style: appStyleWithHt(
                        Dimensions.font20 * 2,
                        AppColor.primaryColor,
                        FontWeight.bold,
                        1.5,
                      ),
                    ),
                    Text(
                      "Collection",
                      style: appStyleWithHt(
                        Dimensions.font20 * 2,
                        AppColor.primaryColor,
                        FontWeight.bold,
                        1.2,
                      ),
                    ),
                    SizedBox(height: Dimensions.height05),

                    //tabbar
                    TabBar(
                      automaticIndicatorColorAdjustment: true,
                      indicatorColor: AppColor.transparentColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppColor.primaryColor,
                      labelStyle: appStyle(
                        Dimensions.font25,
                        AppColor.whiteColor,
                        FontWeight.bold,
                      ),
                      unselectedLabelColor: AppColor.greyColor,
                      tabs: const [
                        Tab(text: "Men Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ],
                    ),
                    // end tabbar
                  ],
                ),
              ),
            ),
            //end TopText

            // Tabbar

            Padding(
              padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.225),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Container(
                        height: Dimensions.height30 * 10,
                        width: Dimensions.screenWidth,
                        color: Colors.redAccent,
                        child: const Center(
                          child: Text("1"),
                        ),
                      ),
                    ],
                  ),

                  //
                  Column(
                    children: [
                      Container(
                        height: Dimensions.height30 * 10,
                        width: Dimensions.screenWidth,
                        color: Colors.greenAccent,
                        child: const Center(
                          child: Text("2"),
                        ),
                      ),
                    ],
                  ),

                  //

                  //
                  Column(
                    children: [
                      Container(
                        height: Dimensions.height30 * 10,
                        width: Dimensions.screenWidth,
                        color: Colors.orangeAccent,
                        child: const Center(
                          child: Text("3"),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Shoews",
                                style: appStyle(
                                  Dimensions.font20,
                                  AppColor.primaryColor,
                                  FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Show All",
                                    style: appStyle(
                                      Dimensions.font15,
                                      AppColor.greyColor,
                                      FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            //end Tabbar
          ],
        ),
      ),
    );
  }
}
