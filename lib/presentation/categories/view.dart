import 'dart:math';

import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'controller.dart';
part 'widgets/category_header.dart';
part 'widgets/category_image.dart';
part 'widgets/category_list.dart';
part 'widgets/category_tile.dart';
part 'widgets/close_button.dart';
part 'widgets/menu_types.dart';
part 'widgets/scroll_down_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: MenuType(),
          ),
          Divider(
            height: 0.5,
            color: Color(0xFFA9AAAE),
          ),
          _CategoryHeader(),
          _CategoryList(),
        ],
      ),
    );
  }
}
