import 'dart:async';
import 'dart:developer';

import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:explorex/domains/explorex_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part 'controller.dart';
part 'widgets/category_header.dart';
part 'widgets/category_image.dart';
part 'widgets/category_list.dart';
part 'widgets/category_tile.dart';
part 'widgets/close_button.dart';
part 'widgets/menu_types.dart';
part 'widgets/scroll_down_button.dart';

class DishPage extends StatelessWidget {
  final ExplorexData data;
  final String selectedCategory;
  final Menu selectedMenu;

  const DishPage({
    super.key,
    required this.data,
    required this.selectedCategory,
    required this.selectedMenu,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      _CategoryController(
        data: data,
        oldSelectedCategory: selectedCategory,
        oldSelectedMenu: selectedMenu,
      ),
    );

    return WillPopScope(
      onWillPop: controller._returnToMenuScreen,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            150.toAutoScaledHeight.toVerticalSpace,
            const _CloseButton(),
            8.toAutoScaledHeight.toVerticalSpace,
            Container(
              padding: EdgeInsets.only(
                top: 24.toAutoScaledHeight,
                bottom: 16.toAutoScaledWidth,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const MenuType(),
            ),
            const Divider(
              height: 0.5,
              color: Color(0xFFA9AAAE),
            ),
            const _CategoryHeader(),
            const _CategoryList(),
          ],
        ),
        floatingActionButton: _ScrollDownButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}