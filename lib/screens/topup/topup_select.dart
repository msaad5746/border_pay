import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);


  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              padding: const EdgeInsets.only(top: 39.03,bottom: 11.82,left: 20.36,right: 20.36),
              child: Text('Enter Amount of Topup',style: CustomizedTheme.sf_b_W500_19,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.36,right: 20.36,top: 11.82),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.only(topLeft:  Radius.circular(10.0),bottomLeft:  Radius.circular(10.0)),
                              borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
                          labelText: "Number of People",
                          labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.only(topLeft:  Radius.circular(10.0),bottomLeft:  Radius.circular(10.0)),
                              borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .7),
                          ),
                        ),
                        // controller: personController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // Return null if the entered email is valid
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter a number';
                          }
                          if (value.trim().length > 9) {
                            return 'You can pay up for 9 people';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomizedTheme.colorAccent,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    width: 82.24,
                    height: 60,
                    child: Center(child: Text('AED',style: CustomizedTheme.sf_w_W400_17)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 73.07,bottom: 11.55,left: 20.36,right: 20.36),
              child: Text('Select Topup Method',style: CustomizedTheme.sf_b_W500_19,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.36),
              child: Row(
                children: [
                  Expanded(child: GestureDetector(onTap: (){Navigator.pushNamed(context, '/topup_detail');},child: Image.asset('assets/payments/ic_cd_db.png',fit: BoxFit.contain,))),
                  const SizedBox(width: 10.73,),
                  Expanded(child: GestureDetector(onTap: (){Navigator.pushNamed(context, '/topup_detail');},child: Image.asset('assets/payments/ic_cd_db.png',fit: BoxFit.contain,))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.36,vertical: 24.53),
              child: Row(
                children: [
                  Expanded(child: GestureDetector(onTap: (){Navigator.pushNamed(context, '/topup_detail');},child: Image.asset('assets/payments/ic_bank.png',fit: BoxFit.contain,))),
                  const SizedBox(width: 10.73,),
                  Expanded(child: Image.asset('assets/payments/ic_samsungpay.png',fit: BoxFit.contain,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
