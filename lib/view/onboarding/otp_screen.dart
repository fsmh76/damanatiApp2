
//import 'package:damanati_app/view/user_information_screen.dart';
import 'package:damaanati_ft/view/onboarding/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../drafts/number.provider.dart';
import '../home/home_screen.dart';
//import '../widgets/custom_button.dart';



class OtpScreen extends StatefulWidget {
  
  
   final String enteredValue;

  const OtpScreen({super.key, required this.enteredValue});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

    late String displayedValue;

  @override
  void initState() {
    super.initState();
    // Extract the last 4 digits or display the whole string if it's less than 4 digits
    displayedValue = widget.enteredValue.length > 4
        ? widget.enteredValue.substring(widget.enteredValue.length - 4)
        : widget.enteredValue;
  }


   var selectedindex = 0;
  String otpcode = '';

  addDigit(int digit) {
    if (otpcode.length > 5) {
      return;
    }
    setState(() {
       otpcode = otpcode + digit.toString();
      _pinController.text = otpcode; // Update the controller's text
      print('Code is $otpcode');
      selectedindex = otpcode.length;
    });
  }

  backspace() {
    if (otpcode.length == 0) {
      return;
    }
    setState(() {
      otpcode = otpcode.substring(0, otpcode.length - 1);
      _pinController.text = otpcode; // Update the controller's text
      selectedindex = otpcode.length;
    });
  }
 
  
  TextEditingController _pinController = TextEditingController();

  String? otpCode;
  // final String verificationId = Get.arguments[0];
  // FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    
    _pinController.dispose();
    super.dispose(); 
  }

  // // verify otp
  // void verifyOtp(
  //     String verificationId,
  //     String userOtp,
  //     ) async {
  //   try {
  //     PhoneAuthCredential creds = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: userOtp);
  //     User? user = (await auth.signInWithCredential(creds)).user;
  //     if (user != null) {
  //       Get.to(HomeScreen());
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar(
  //       e.message.toString(),
  //       "Failed",
  //       colorText: const Color.fromARGB(255, 24, 24, 24),
  //     );
  //   }
  // }


  // void _login() {
  //   if (otpCode != null) {
  //     verifyOtp(verificationId, otpCode!);
  //   } else {
  //     Get.snackbar(
  //       "Enter 6-Digit code",
  //       "Failed",
  //       colorText: Color.fromARGB(255, 11, 11, 11),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {

     // Extract the last 4 digits or display the whole string if it's less than 4 digits
        
        



     TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: Colors.black.withBlue(40),
    );
    return Scaffold(
            appBar: AppBar(
        leading: const BackButton(
         color: Colors.black,),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Text(
          'Enter OTP Code',
          style:  GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, // like this!
        
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              children: [
            Column(
            children: [
              Padding(
                padding:  const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                            "We have sent an OTP to your mobile ",
                            style:  GoogleFonts.notoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              
                            ),
                      ),
                    ),
                     Align(
                      alignment: Alignment.center,
                      child: Text('number ending with +966 *****$displayedValue',
                            style:  GoogleFonts.notoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              
                            ),
                      ),
                    ),
                  ],
                ),

                
              ),

                    Pinput(
                      controller:  _pinController,
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.purple.shade200,
                            ),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),

                         SizedBox(height: 30,),
                       Padding(
                     padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                     child: SizedBox(
                      height: 60,
                       child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          
                                              backgroundColor: HexColor('#4453CE'), //background color of button
                                            
                               
                                             shape: RoundedRectangleBorder( //to set border radius to button
                                             borderRadius: BorderRadius.circular(10)
                                             ),
                                           padding: const EdgeInsets.all(20),
                                            ),
                                            onPressed:(){}, //_login,
                                                child:  Text(
                                                "Confirm ",
                                                style:  GoogleFonts.notoSans(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w500,
                                                 color: const Color.fromARGB(255, 255, 255, 255),
                              
                                                    ),
                                                 ),),
                     ),
                   ),
              ////////////here start
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton( 
                          onPressed:(){},//_login,
                         child: Text('Resend Code', selectionColor: HexColor('#9B40CD') ,
                                     style:  GoogleFonts.notoSans(
                                          fontSize: 15,
                                          color:  HexColor('#4453CE'),
                                          fontWeight:  FontWeight.w600,
                                           decoration: TextDecoration.underline,
                                          
                                          
                                        ),
                                    ),
                                    ),
                      ),




            ],
             ),
             SizedBox(
              height: 70,
             ),

                             Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                          
                                          onPressed: () {
                                            addDigit(1);
                                          },
                                          child: Text('1', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child:TextButton(
                                         
                                          onPressed: () {
                                            addDigit(2);
                                          },
                                          child: Text('2', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(3);
                                          },
                                          child: Text('3', style: textStyle)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                          
                                          onPressed: () {
                                            addDigit(4);
                                          },
                                          child: Text('4', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(5);
                                          },
                                          child: Text('5', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(6);
                                          },
                                          child: Text('6', style: textStyle)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(7);
                                          },
                                          child: Text('7', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(8);
                                          },
                                          child: Text('8', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(9);
                                          },
                                          child: Text('9', style: textStyle)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:TextButton(
                                          
                                          onPressed: () {
                                            backspace();
                                          },
                                          child: Icon(Icons.backspace_outlined,
                                              color: Colors.black.withBlue(40),
                                              size: 30)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                         
                                          onPressed: () {
                                            addDigit(0);
                                          },
                                          child: Text('0', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                          
                                          onPressed: () {},
                                          child: Icon(Icons.check,
                                              color: Colors.black.withBlue(40),
                                              size: 30)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
             
              ],
            ),
          ),
        ),
      ),
    );
                  

  }
  
}