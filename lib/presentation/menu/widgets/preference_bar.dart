part of '../view.dart';

class PreferenceBar extends StatelessWidget {
  const PreferenceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Veg'),
        Text('Non Veg'),
        Text('Vegan'),
      ],
    );
  }
}
