import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: CustomizedTheme.primaryBold,
          ),
        ),
        child: Icon(
          Icons.check,
          size: 18,
          color: CustomizedTheme.primaryColor,
        ),
      ),
    );
  }
}
