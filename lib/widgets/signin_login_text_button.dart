import 'package:flutter/material.dart';

class SignupLoginTextButton extends StatelessWidget {
  const SignupLoginTextButton({
    required this.text,
    required this.labelButton,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final String text;
  final String labelButton;
  final Function() onPress;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(
            text,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),
          ),
          Text(
            labelButton,
            style: TextStyle(color: Color(0xFF19731C), fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
