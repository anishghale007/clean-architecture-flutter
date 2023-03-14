import 'package:flutter/material.dart';
import '../../color_util.dart';

class OtherRegisterMethodWidget extends StatelessWidget {
  final String iconName;
  const OtherRegisterMethodWidget({
    Key? key,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.kInactiveColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Image.asset("images/$iconName"),
      ),
    );
  }
}
