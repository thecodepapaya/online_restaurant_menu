part of '../view.dart';

class RecommendedBar extends StatelessWidget {
  const RecommendedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Text('Recommended dish 3'),
    );
  }
}
