import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/app_style.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';

class ProductCard extends StatefulWidget {
  final String id;
  final String name;
  final String category;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(Dimensions.width10, 0, Dimensions.width20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        child: Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth * 0.6,
          padding: EdgeInsets.all(Dimensions.width10),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.whiteColor,
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    height: Dimensions.screenHeight * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite,
                        size: Dimensions.iconSize25,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStyleWithHt(
                        Dimensions.font30,
                        AppColor.blackColor,
                        FontWeight.bold,
                        1.1,
                      ),
                    ),
                    Text(
                      widget.category,
                      style: appStyleWithHt(
                        Dimensions.font15,
                        AppColor.greyColor,
                        FontWeight.bold,
                        1.5,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyle(
                        Dimensions.font30,
                        AppColor.blackColor,
                        FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Colors",
                          style: appStyleWithHt(
                            Dimensions.font15,
                            AppColor.greyColor,
                            FontWeight.w400,
                            1.5,
                          ),
                        ),
                        SizedBox(width: Dimensions.width05),
                        ChoiceChip(
                          label: const Text(" "),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: AppColor.primaryColor,
                          disabledColor: AppColor.greyColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
