import 'dart:developer';
import 'dart:math' as MATH;

import 'package:explorex/app/common/counter.dart';
import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:explorex/data/data_repository.dart';
import 'package:explorex/domains/explorex_data.dart';
import 'package:explorex/presentation/categories/view.dart';
import 'package:explorex/presentation/dish/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part 'controller.dart';
part 'widgets/app_bar.dart';
part 'widgets/category_card.dart';
part 'widgets/dish_card.dart';
part 'widgets/error.dart';
part 'widgets/fab.dart';
part 'widgets/loader.dart';
part 'widgets/preference_bar.dart';
part 'widgets/recommended_bar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _MenuController controller = Get.put(_MenuController());

    return Obx(() {
      if (controller.isDataLoading) {
        return const _Loader();
      } else if (!controller.hasData) {
        return const _NoData();
      }

      final categorySortedData = controller.categorySortedData.value;

      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFE5E6EF),
          body: Column(
            children: [
              const EAppBar(),
              Container(
                color: Colors.black,
                height: 0.5,
                width: double.infinity,
              ),
              const PreferenceBar(),
              const RecommendedBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      16.toAutoScaledHeight.toVerticalSpace,
                      CategoryCard(
                        categoryName: "Recommended",
                        entries: controller.recommendedDishes.value,
                      ),
                      ...categorySortedData.entries
                          .map(
                            (e) => CategoryCard(
                              key: GlobalObjectKey(e.key),
                              categoryName: e.key,
                              entries: e.value,
                            ),
                          )
                          .toList(),
                      16.toAutoScaledHeight.toVerticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const Fab(),
        ),
      );
    });
  }
}
