import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    required this.onPress,
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
      onPress
      ,
      style: ElevatedButton.styleFrom(
          primary:  Color(0xFF19731C),
          minimumSize: const Size.fromHeight(45),
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}