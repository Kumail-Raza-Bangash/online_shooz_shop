import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shooz_shop/controllers/mainscreen_provider.dart';
import 'package:online_shooz_shop/view/widgets/bottom_nav_widget.dart';
import 'package:provider/provider.dart';

class BottoNavBar extends StatelessWidget {
  const BottoNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BotomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 0;
                    },
                    iconSize: mainScreenNotifier.pageIndex == 0 ? 30 : 20,
                    icon: mainScreenNotifier.pageIndex == 0
                        ? MaterialCommunityIcons.home
                        : MaterialCommunityIcons.home_outline,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 1;
                    },
                    iconSize: mainScreenNotifier.pageIndex == 1 ? 30 : 20,
                    icon: mainScreenNotifier.pageIndex == 1
                        ? Ionicons.search_outline
                        : Ionicons.search,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 2;
                    },
                    iconSize: mainScreenNotifier.pageIndex == 2 ? 30 : 20,
                    icon: mainScreenNotifier.pageIndex == 2
                        ? Ionicons.cart
                        : Ionicons.cart_outline,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      mainScreenNotifier.pageIndex = 3;
                    },
                    iconSize: mainScreenNotifier.pageIndex == 3 ? 30 : 20,
                    icon: mainScreenNotifier.pageIndex == 3
                        ? Ionicons.person
                        : Ionicons.person_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
