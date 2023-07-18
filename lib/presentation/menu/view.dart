import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:explorex/presentation/categories/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/common/transparent_route.dart';

part 'controller.dart';
part 'widgets/category_card.dart';
part 'widgets/dish_card.dart';
part 'widgets/preference_bar.dart';
part 'widgets/recommended_bar.dart';
part 'widgets/fab.dart';
part 'widgets/app_bar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E6EF),
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
                    CategoryCard(),
                    CategoryCard(),
                    CategoryCard(),
                    CategoryCard(),
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
  }
}
