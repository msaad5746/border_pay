import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlueBackButton extends StatefulWidget {
  BuildContext context;

  BlueBackButton({Key? key, required this.context}) : super(key: key);


  @override
  _BlueBackButtonState createState() => _BlueBackButtonState();
}

class _BlueBackButtonState extends State<BlueBackButton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pop(widget.context);
      },
      child: Container(
          height: 37.26.h,
          width: 37.26.w,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.11.r),
              color: CustomizedTheme.colorAccent),
          child: Icon(Icons.arrow_back,color: CustomizedTheme.white)),
    );
  }
}
