import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';

class TopUpDetailPage extends StatefulWidget {
  const TopUpDetailPage({Key? key}) : super(key: key);


  @override
  _TopUpDetailPageState createState() => _TopUpDetailPageState();
}

class _TopUpDetailPageState extends State<TopUpDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
                        padding: const EdgeInsets.only(top: 50.0,left: 20.36,right: 20.36),
              child: Container(
                  height: 37.26,
                  width: 37.26,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.11),
                      color: CustomizedTheme.colorAccent),
                  child: Icon(Icons.arrow_back,color: CustomizedTheme.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36.54,right: 20.36,left: 20.36),
            child: Text("Top up Details",style: CustomizedTheme.sf_b_W500_26,),
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.36),
            child: SizedBox(
              height: 69,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top up Method',style: CustomizedTheme.sf_b_W400_17),
                Text('By Credit card',style: CustomizedTheme.sf_b_W500_17),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.36,vertical: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top up Amount',style: CustomizedTheme.sf_b_W400_17),
                Text('AED 105',style: CustomizedTheme.sf_b_W500_17),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Container(
              height: .5,
              color: CustomizedTheme.colorAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.36,vertical: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount',style: CustomizedTheme.sf_b_W400_17),
                Text('AED 105',style: CustomizedTheme.sf_b_W500_17),
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(left: 20.36,right: 20.36,bottom: 37.93),
            child: Container(
              height: 61.07,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // border: Border.all(color: CustomizedTheme.white,width: .5),
                  color: CustomizedTheme.colorAccent
              ),
              child: TextButton(onPressed: () {Navigator.pushNamed(context, '/topup_successful');},
                  child: Text("Continue",style: CustomizedTheme.w_W500_19)),
            ),
          ),
        ],
      ),
    );
  }
}
