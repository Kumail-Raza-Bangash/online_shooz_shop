import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/app_style.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';

class MenShoes extends StatelessWidget {
  const MenShoes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.screenHeight * 0.4,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey,
                height: Dimensions.screenHeight,
                width: Dimensions.screenWidth * 0.6,
                margin: EdgeInsets.all(Dimensions.width05),
              );
            },
          ),
        ),
        Column(
          children: [
            SizedBox(height: Dimensions.height05),
            Padding(
              padding: EdgeInsets.fromLTRB(
                Dimensions.width05,
                Dimensions.height10,
                Dimensions.width05,
                Dimensions.height10,
              ),
              child: Row(
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
                      Icon(
                        Icons.arrow_right,
                        size: Dimensions.iconSize25,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height30 * 5,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: Dimensions.screenHeight,
                    width: Dimensions.width30 * 5,
                    margin: EdgeInsets.all(Dimensions.width10),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.greyColor,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(2, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      color: AppColor.whiteColor,
                    ),
                    child: Image.asset("assets/images/Shoes_03.png"),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
