import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shooz_shop/models/sneaker_model.dart';
import 'package:online_shooz_shop/services/helper.dart';
import 'package:online_shooz_shop/view/resources/appstyle.dart';
import 'package:online_shooz_shop/view/resources/colors.dart';
import 'package:online_shooz_shop/view/widgets/custom_button_widget.dart';
import 'package:online_shooz_shop/view/shared/latest_shoes.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getkids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
    getMale();
    getkids();

    getFemale();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: AppColor.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: AppColor.whiteColor,
                    labelStyle:
                        appstyle(24, AppColor.whiteColor, FontWeight.bold),
                    unselectedLabelColor: AppColor.greyColor.withOpacity(0.7),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kids Shoes",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  latestShoes(male: _male),
                  latestShoes(male: _female),
                  latestShoes(male: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.transparentColor,
      barrierColor: AppColor.greyColor,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 7,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: AppColor.greyColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Filter",
                    style: appstyle(40, AppColor.blackColor, FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Gender",
                    style: appstyle(20, AppColor.blackColor, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        label: "Men",
                        buttonClr: AppColor.blackColor,
                      ),
                      CustomButtonWidget(
                        label: "Women",
                        buttonClr: AppColor.greyColor,
                      ),
                      CustomButtonWidget(
                        label: "Kids",
                        buttonClr: AppColor.greyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Category",
                    style: appstyle(20, AppColor.blackColor, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        label: "Shoes",
                        buttonClr: AppColor.blackColor,
                      ),
                      CustomButtonWidget(
                        label: "Apparrels",
                        buttonClr: AppColor.greyColor,
                      ),
                      CustomButtonWidget(
                        label: "Accessories",
                        buttonClr: AppColor.greyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Price",
                    style: appstyle(20, AppColor.blackColor, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    value: value,
                    activeColor: AppColor.blackColor,
                    inactiveColor: AppColor.greyColor,
                    thumbColor: AppColor.blackColor,
                    max: 500,
                    divisions: 50,
                    label: value.toString(),
                    secondaryTrackValue: 200,
                    onChanged: (double value) {},
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Brand",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 80,
                    child: ListView.builder(
                      itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Image.asset(
                              brand[index],
                              height: 60,
                              width: 80,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
