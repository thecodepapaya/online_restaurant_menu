part of '../view.dart';

class _NoData extends StatelessWidget {
  const _NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("No data"),
      ),
    );
  }
}
