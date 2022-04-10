import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';

class NumberPeoplePage extends StatefulWidget {
  const NumberPeoplePage({Key? key}) : super(key: key);


  @override
  _NumberPeoplePageState createState() => _NumberPeoplePageState();
}

class _NumberPeoplePageState extends State<NumberPeoplePage> {
  TextEditingController personController = TextEditingController();
  int _firstDigit = 010;
  var registerCAT = 'hatta';
  // int _secondDigit = 010;
  // int _thirdDigit = 010;
  // int _fourthDigit = 010;
  int checker = 010;
  //Buttons
  Widget buildButton(int buttonText) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if (personController.text.isEmpty) {
            personController.text = buttonText.toString();
          }
          var otp = _firstDigit.toString();

        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
        child: Container(
          height: 44.86,
          // width: 92.96,
          decoration: BoxDecoration(
              color: CustomizedTheme.primaryBold,
              borderRadius: BorderRadius.circular(6.93),
              border: Border.all(color: CustomizedTheme.white)
          ),
          child: Center(child: Text(buttonText.toString(),style: CustomizedTheme.w_W500_2617,)),
        ),
      ),
    );
  }
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
            padding: const EdgeInsets.only(top: 31.43,left: 20,right: 20),
            child: Text('Select one of the options below:',style: CustomizedTheme.sf_b_W500_19),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 44),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 61.07,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        side: BorderSide(width: 1.0, color: registerCAT == 'hatta' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack),
                      ),
                      onPressed: () {
                        setState(() {
                          registerCAT = 'hatta';
                          print(registerCAT);
                        });
                      },
                      child: Text('Hatta',style: TextStyle(color: registerCAT == 'hatta' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack)),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 61.07,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        side: BorderSide(width: 1.0, color: registerCAT == 'portrashid' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack),
                      ),
                      onPressed: () {
                        setState(() {
                          registerCAT = 'portrashid';
                          print(registerCAT);
                        });
                      },
                      child: Text('Port Rashid',style: TextStyle(color: registerCAT == 'portrashid' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text('Select the number of people you want to pay the exit/entry fees for:',style: CustomizedTheme.sf_b_W500_19),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 52.23,left: 20.36,right: 20.36),
            child: TextFormField(
              showCursor: true,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
                labelText: "Number of People",
                labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
                focusedBorder: const OutlineInputBorder(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.lightBlue,width: 1),
                ),
              ),
              controller: personController,
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
          Padding(
            padding: const EdgeInsets.only(top: 15.44,left: 20.36,right: 20.36),
            child: Row(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.75),
                  child: Image.asset('assets/icons/ic_exclamation.png'),
                ),
                Text('(Exit fee of 1 person is AED 35)',style: CustomizedTheme.sf_b_W300_14,)
              ],
            ),
          ),
          const Spacer(),
            registerCAT == 'hatta' ? Padding(
            padding: const EdgeInsets.only(left: 20.36,right: 20.36,bottom: 37.93),
            child: Container(
              height: 61.07,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // border: Border.all(color: CustomizedTheme.white,width: .5),
                  color: CustomizedTheme.colorAccent
              ),
              child: TextButton(onPressed: () {Navigator.pushNamed(context, '/fee_detail');},
                  child: Text("Pay Exit Fee",style: CustomizedTheme.w_W500_19)),
            ),
          ):Padding(
              padding: const EdgeInsets.only(left: 20.36,right: 20.36,bottom: 37.93),
            child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 61.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          // border: Border.all(color: CustomizedTheme.white,width: .5),
                          color: CustomizedTheme.colorAccent
                      ),
                      child: TextButton(onPressed: () {Navigator.pushNamed(context, '/fee_detail');},
                          child: Text("Pay Entry Fee",style: CustomizedTheme.w_W500_19)),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: Container(
                      height: 61.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          // border: Border.all(color: CustomizedTheme.white,width: .5),
                          color: CustomizedTheme.colorAccent
                      ),
                      child: TextButton(onPressed: () {Navigator.pushNamed(context, '/fee_detail');},
                          child: Text("Pay Exit Fee",style: CustomizedTheme.w_W500_19)),
                    ),
                  ),
                ],
              ),
          ),

          // KEYBOARD

          // Container(
          //   height: 351.87,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       color: CustomizedTheme.primaryBold,
          //       borderRadius: BorderRadius.vertical(top: Radius.circular(50.0))
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 19.36,vertical: 76.57),
          //     child: Container(
          //       // height: MediaQuery.of(context).size.height,
          //       // width: MediaQuery.of(context).size.width,
          //       child: Table(
          //         // defaultColumnWidth: IntrinsicColumnWidth(),
          //         columnWidths: {
          //           0: FlexColumnWidth(92.96),
          //           1: FlexColumnWidth(92.96),
          //           2: FlexColumnWidth(92.96),
          //         },
          //         children: [
          //           TableRow(
          //               children: [
          //                 buildButton(1),
          //                 buildButton(2),
          //                 buildButton(3),
          //               ]
          //           ),
          //           TableRow(
          //               children: [
          //                 buildButton(4),
          //                 buildButton(5),
          //                 buildButton(6),
          //               ]
          //           ),
          //           TableRow(
          //               children: [
          //                 buildButton(7),
          //                 buildButton(8),
          //                 buildButton(9),
          //               ]
          //           ),
          //           TableRow(
          //               children: [
          //                 GestureDetector(
          //                   onTap: (){
          //                     setState(() {
          //                       if(personController.text.isNotEmpty){
          //                           personController.text = '';
          //                         }
          //                     });
          //                   },
          //                   child: Padding(
          //                     padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
          //                     child: Container(
          //                       height: 44.86,
          //                       // width: 92.96,
          //                       decoration: BoxDecoration(
          //                           color: CustomizedTheme.white,
          //                           borderRadius: BorderRadius.circular(6.93),
          //                           border: Border.all(color: CustomizedTheme.white)
          //                       ),
          //                       child: Image.asset('assets/icons/ic_backspace.png'),
          //                     ),
          //                   ),
          //                 ),
          //                 buildButton(0),
          //                 GestureDetector(
          //                   onTap: (){Navigator.pushNamed(context, '/payment_successful');},
          //                   child: Padding(
          //                     padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
          //                     child: Container(
          //                       height: 44.86,
          //                       // width: 92.96,
          //                       decoration: BoxDecoration(
          //                           color: CustomizedTheme.white,
          //                           borderRadius: BorderRadius.circular(6.93),
          //                           border: Border.all(color: CustomizedTheme.white)
          //                       ),
          //                       child: Image.asset('assets/icons/ic_polygon.png'),
          //                     ),
          //                   ),
          //                 ),
          //               ]
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )

        ],
      ),
    );
  }
}
