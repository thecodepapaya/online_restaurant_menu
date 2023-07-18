import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'controller.dart';
part 'widgets/category_card.dart';
part 'widgets/dish_card.dart';
part 'widgets/preference_bar.dart';
part 'widgets/recommended_bar.dart';
part 'widgets/fab.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('explorex'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 1,
            width: double.infinity,
          ),
          PreferenceBar(),
          RecommendedBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Fab(),
    );
  }
}
