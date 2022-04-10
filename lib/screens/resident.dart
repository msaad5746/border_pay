import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResidentPage extends StatefulWidget {
  const ResidentPage({Key? key}) : super(key: key);

  @override
  _ResidentPageState createState() => _ResidentPageState();
}

class _ResidentPageState extends State<ResidentPage> {
  bool isResident = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 33.73,
        leading: Center(
          child: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
                height: 33.73.h,
                width: 33.73.w,
                // margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.16.r),
                    color: CustomizedTheme.colorAccent),
                child: Icon(Icons.arrow_back,color: CustomizedTheme.white)),
          ),
        ),
        title: Text("New User", style: CustomizedTheme.title_p_W500_21),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Text('Select one option of the following and move forward by clicking the button below.',style: CustomizedTheme.sf_bo_W400_15,),
              SizedBox(height: 50.h),
               GestureDetector(
                 onTap: (){
                   setState(() {
                     isResident = true;
                   });
                 },
                 child: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundImage: isResident ? const AssetImage('assets/icons/ic_resident_active.png') : const AssetImage('assets/icons/ic_resident.png'),
                    ),
                  ),
                 ),
               ),
              SizedBox(height: 25.h),

              Text('UAE Resident',style: CustomizedTheme.sf_b_W500_18,),

              SizedBox(height: 40.h),

              GestureDetector(
                onTap: (){
                  setState(() {
                    isResident = false;
                  });
                },
                child: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundImage: isResident ? const AssetImage('assets/icons/ic_non_resident.png') : const AssetImage('assets/icons/ic_non_resident_active.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text('Non-UAE Resident',style: CustomizedTheme.sf_b_W500_18,),
              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: CustomizedTheme.colorAccent
                      ),
                      child: TextButton(onPressed: () {Navigator.pushNamed(context, '/ScanIDPage');},
                          child: Text("Next",style: CustomizedTheme.w_W500_19)),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10.h),

            ],
          ),
        ),
      ),
    );
  }
}
