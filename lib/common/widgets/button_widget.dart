import 'package:flutter/material.dart';
import 'package:v_commerce_vendor/color_util.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPress;
  final double radius;
  final bool isLoading;

  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.onPress,
    required this.radius,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red;
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return ColorUtil.kPrimaryColor; // Use the component's default.
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(radius),
          )),
        ),
      ),
      onPressed: onPress,
      child: isLoading
          ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              buttonText,
              style: TextStyle(
                color: textColor,
              ),
            ),
    );
  }
}
