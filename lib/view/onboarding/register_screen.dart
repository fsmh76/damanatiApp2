import 'package:country_picker/country_picker.dart';
import 'package:damaanati_ft/view/drafts/number.provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:damanati_app/view/otp_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import 'otp_screen.dart';



//import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {

  
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var selectedindex = 0;
  String code = '';
  final TextEditingController phoneController = TextEditingController(); // Declare the controller

  addDigit(int digit) {
    if (code.length > 9) {
      return;
    }
    setState(() {
      code = code + digit.toString();
      phoneController.text = code; // Update the controller's text
      print('Code is $code');
      selectedindex = code.length;
    });
  }

  backspace() {
    if (code.length == 0) {
      return;
    }
    setState(() {
     code = code.substring(0, code.length - 1);
      phoneController.text = code; // Update the controller's text
      selectedindex = code.length;
    });
  }
  
  
  
  // Future<void> signInWithPhoneNumber(String phoneNumber) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential);
  //       // authentication successful, do something
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       // authentication failed, do something
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       // code sent to phone number, save verificationId for later use
  //       String smsCode = ''; // get sms code from user
  //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId,
  //         smsCode: smsCode,
  //       );
  //       Get.to(OtpScreen(), arguments: [verificationId]);
  //       await auth.signInWithCredential(credential);
  //       // authentication successful, do something
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  Country selectedCountry = Country(
    phoneCode: "966",
    countryCode: "KSA",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Saudi Arabia",
    example: "Saudi Arabia",
    displayName: "Saudi Arabia",
    displayNameNoCountryCode: "KSA",
    e164Key: "",
  );

  // void _userLogin() async {
  //   String mobile = phoneController.text;
  //   if (mobile == "") {
  //     Get.snackbar(
  //       "Please enter the mobile number!",
  //       "Failed",
  //       colorText: const Color.fromARGB(255, 22, 21, 21),
  //     );
  //   } else {
  //     signInWithPhoneNumber("+${selectedCountry.phoneCode}$mobile");
  //   }
  // }

   @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),);
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
          'LOGIN',
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
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
            Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(  bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Phone Number ",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),

                
              ),
              
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                  cursorColor: HexColor('#4453CE'),
                  controller: phoneController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  const BorderSide(color: Colors.black45, width: 2.5,),
                    ),
                    focusedBorder: OutlineInputBorder(
                      
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:HexColor('#9B40CD'), width: 2.5),
                    ),
                   prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  //Provider.of<InputProvider>(context, listen: false).setCountryCode(value);
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),


                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                        : null,



                  ),
                ),
                
                  ),
                         
                         SizedBox(height: 15,),

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
                                            ),onPressed:(){
                                                 Navigator.push(
                                                 context,
                                                 MaterialPageRoute(builder: (context) => OtpScreen(enteredValue: phoneController.text)),
                                                );
                                            }, //_userLogin,
                                                child:  Text(
                                                "Send OTP ",
                                                style:  GoogleFonts.notoSans(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w500,
                                                 color: const Color.fromARGB(255, 255, 255, 255),
                              
                                                    ),
                                                 ),),
                     ),
                   )

            ],
             ),
             SizedBox(
              height: 150,
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
  
                