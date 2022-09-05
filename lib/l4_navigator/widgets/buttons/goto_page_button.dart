import 'package:flutter/material.dart';
import '../../constants/custom_colors.dart';

class GoToPageButton extends StatelessWidget {
  const GoToPageButton({
    Key? key,
    required this.text,
    required this.routeName,
  }) : super(key: key);
  final String text;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            routeName,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: CustomColors.orangeColor,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
