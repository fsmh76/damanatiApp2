import 'dart:convert';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:damaanati_ft/api_connection/api_connaction.dart';
import 'package:damaanati_ft/view/home/home_screen.dart';
import 'package:damaanati_ft/view/users/user_model.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart'as http;

import 'uInformationDropDown_model.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  _UserInfromationScreenState createState() => _UserInfromationScreenState();
}


class _UserInfromationScreenState extends State<UserInfromationScreen> {

 

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

  
  // late final File? imageFile;
  // final placeholderImageUrl =
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaYAvsj5zJqb6jSNdlX8R6M2_LDR05IJSPabWMFc_SMCDemb2R5b5kveXi99LCif7saKc&usqp=CAU";
      
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phonenumbercontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var citycontroller = TextEditingController();
  
  //OptionItem get newValue => null;

  validateUserNum()async
  {
      try
      {
        var res = await http.post(
          Uri.parse(API.validatePhoneNum),
          body:{
             'Phone_Num': phonenumbercontroller.text.trim(),
          }
        );

        if(res.statusCode == 200) //success
        {
         var resBodyOfValidatNumber = jsonDecode(res.body);

         if(resBodyOfValidatNumber['phonNumFound']==true)
         {
          _displaySuccessMotionToast();
         }
         else
         {

          //regester & save new user
          RegisterAndsaveUserRecord();

         }

        }

      }
      catch(e)
      {

      }
  }

  //  @override
  // void dispose() {
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   super.dispose();
  // }

  RegisterAndsaveUserRecord()async
  {
    User userModel = User(
      1,
      phonenumbercontroller.text.trim(),
      optionItemSelectedgender.title,
      firstNameController.text.trim(),
      lastNameController.text.trim(),
      
      
      //gendercontroller.text.trim(),
      //citycontroller.text.trim(),
      optionItemSelected.title,
      
      //imageFile as String,
       

    );
    try
    {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson()
      );
      if(res.statusCode == 200)
      {
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['success'])
        {
          _displaySuccessMotionToast;
        }
      }
      else
      {
          _displayErrorMotionToast;  
      }

    }
    catch(e)
    {
      print(e.toString());


    }

  }

  void _displayErrorMotionToast() {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Please enter your full informations'),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }



    void _displaySuccessMotionToast() {
    MotionToast toast = MotionToast.success(
      title: const Text(
        'Saved',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'welcom to Damaanati',
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromRight,
      dismissable: true,
    );
    toast.show(context);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      toast.dismiss();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
         color: Colors.black,),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Text(
          'Create New Account',
          style:  GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, // like this!
        
      ),
      






      body:Column(
        children: [
          Container(
            height: 550,
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  
                  
                  padding: const EdgeInsets.all(16.0),
                
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              ///////////firstname
                             children:[
                                
                                    Expanded( 
                                    child: Column(
                                      children: [
                                        Padding(
                                padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                            "First Name ",
                                            style:  GoogleFonts.notoSans(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                              
                                            ),
                                  ),
                                ),
                              ),
                                
                               Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 10),
                                    child: TextFormField(
                                      controller: firstNameController,
                                      //autovalidateMode: AutovalidateMode.always, // Enable auto-validation
                                      validator: (val) => val == ""? "please enter first name": null,
                              // {
                              //                if (value == null || value.trim().isEmpty) {
                              //                return 'Please enter your first name';
                              //               }
                              //                return null;
                                          
                              //             },
                                       decoration:  InputDecoration(
                                         border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        borderSide:  const BorderSide(
                                        width: 3,
                                        color: Colors.black45),
                                        
                                         ),
                                         
                                        focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:  BorderSide(
                                        width: 2,
                                        color: HexColor('#9B40CD')),
                                        
                                        
                                        
                                   ),
                                                   
                                              ),
                                             ),
                                  ),
                                
                                      ],
                                    ),
                                
                                
                                    ),
                                //////////////////////////////////////endfirstname
                                ///
                                       Expanded( 
                                    child: Column(
                                      children: [
                                        Padding(
                                padding: const EdgeInsets.only(left: 10,  top: 10, bottom: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                            "Last Name ",
                                            style:  GoogleFonts.notoSans(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                              
                                            ),
                                  ),
                                ),
                              ),
                                
                               Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 20),
                                    child: TextFormField(
                                      //key:_formKey,
                                      //autovalidateMode: AutovalidateMode.always, // Enable auto-validation
                                      controller:  lastNameController,
                                      validator: (val) => val == ""? "Please enter last name": null,
                              // {
                              //               if (value == null || value.trim().isEmpty) {
                              //               return 'Please enter your last name';
                              //                }
                              //              return null;
                              //             },
                                       //initialValue: 'Enter Name',
                                       decoration:  InputDecoration(
                                         border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        borderSide:  const BorderSide(
                                        width: 3,
                                        color: Colors.black45),
                                        
                                         ),
                                         
                                        focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:  BorderSide(
                                        width: 2,
                                        color: HexColor('#9B40CD')),
                                        
                                        
                                   ),
                                                   
                                              ),
                                             ),
                                  ),
                                
                                      ],
                                    ),
                                
                                    ),
                                  
                                
                                
                             ],
                             
                            
                                    
                            ),
                        
                        
                            //phonNumber
                        
                                  Column(
                    children: [
                   Padding(
                  padding: const EdgeInsets.only( left: 12, right: 20, top:10),
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
                      padding: const EdgeInsets.only(left: 15,  top: 10, bottom: 15, right: 10),
                      child: TextFormField(
                        validator: (val) => val == ""? "Please enter phone number": null,
                    cursorColor: HexColor('#4453CE'),
                    controller: phonenumbercontroller,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      setState(() {
                        phonenumbercontroller.text = value;
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
              
              
                      suffixIcon: phonenumbercontroller.text.length > 9
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
                        
                    ],
                     ),
                        
                     
                    
                        
                        
                        
                          ],
                        ),
                      ),
              
                                    Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                                "gender",
                                style:  GoogleFonts.notoSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                  
                                ),
                          ),
                        ),
                        
                        
                      ),
                      
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: 
              
                                  SelectDropList(
              
                                //key:_dropdowngender,
                                itemSelected: optionItemSelectedgender,
                                 dropListModel: dropListModelGender,
                                 showIcon: false,
                                 showArrowIcon: true,
                                 showBorder: true,
                                 paddingTop: 0,
                                 paddingDropItem: 10,
                                 suffixIcon: Icons.arrow_drop_down,
                                 containerPadding: const EdgeInsets.all(10),
                                 icon: const Icon(Icons.person, color: Colors.black),
                                 onOptionSelected: (optionItem) {
                                 optionItemSelectedgender =  optionItem;
                                 setState(() {
                                  optionItemSelectedgender = optionItem;
                                 });
                        },
                      ),
              
              
              
              
                            // TextFormField(
                            //   controller: gendercontroller,
                            //   validator: (val) => val == ""? "Please enter gender": null,
                              
                              
                            //   // {
                            //   //                if (value == null || value.trim().isEmpty) {
                            //   //                return 'Please enter your first name';
                            //   //               }
                            //   //                return null;
                                          
                            //   //             },
                            //    //initialValue: 'Scan or Attach',
                            //    decoration:  InputDecoration(
                            //      border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     borderSide:  const BorderSide(
                            //     width: 3,
                            //     color: Colors.black45),
                            //      ),
                            //     focusedBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(10),
                            //     borderSide:  BorderSide(
                            //     width: 2,
                            //     color: HexColor('#9B40CD')),
                                
                                
                            //   ),
                                           
                            //           ),
                            //          ),
                          ),
                        
                    ],
                     ),
                        
                     
                                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                                "city",
                                style:  GoogleFonts.notoSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                  
                                ),
                          ),
                        ),
                        
                        
                      ),
                      
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: 
              
              
                                 SearchDropList(
                        //key:_dropdowncity,
                        itemSelected: optionItemSelected,
                        dropListModel: dropListModelCity,
                        showIcon: false,
                        showArrowIcon: true,
                        showBorder: true,
                        textEditingController: citycontroller,
                        paddingTop: 0,
                        suffixIcon: Icons.arrow_drop_down,
                        containerPadding: const EdgeInsets.all(10),
                        icon: const Icon(Icons.person, color: Colors.black),
                        onOptionSelected: (optionItem) {
                          optionItemSelected = optionItem;
                          if (kDebugMode) {
                            print(optionItemSelected.id);
                          }
                          setState(() {
                            
                          });
                          }
                          ),
              
              
              
                            // TextFormField(
                            //   controller: citycontroller,
                            //   validator: (val) => val == ""? "Please ": null,
                              
                            //   //  {
                            //   //                if (value == null || value.trim().isEmpty) {
                            //   //                return 'Please enter your first name';
                            //   //               }
                            //   //                return null;
                                          
                            //   //             },
                            //    //initialValue: 'Scan or Attach',
                            //    decoration:  InputDecoration(
                            //     hintText: "enter first name",
                            //      border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     borderSide:  const BorderSide(
                            //     width: 3,
                            //     color: Colors.black45),
                            //      ),
                            //     focusedBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(10),
                            //     borderSide:  BorderSide(
                            //     width: 2,
                            //     color: HexColor('#9B40CD')),
                                
                                
                            //   ),
                                           
                            //           ),
                            //          ),
                          ),
                        
                    ],
                     ),
                        
                        
                      ////////////row end
                    
                      //                 Column(
                      // children: [
                      //   Padding(
                      //     padding: const EdgeInsets.only(left: 20,  top: 15, bottom: 5),
                      //     child: Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Text(
                      //             "Gender",
                      //             style:  GoogleFonts.notoSans(
                      //               fontSize: 15,
                      //               color: Colors.black
                                    
                      //             ),
                      //       ),
                      //     ),
                      //   ),
                          
                          
                          
                      //   SelectDropList(
                      //   //key:_dropdowngender,
                      //   itemSelected: optionItemSelectedgender,
                      //   dropListModel: dropListModelGender,
                      //   showIcon: false,
                      //   showArrowIcon: true,
                      //   showBorder: true,
                      //   paddingTop: 0,
                      //   paddingDropItem: 10,
                      //   suffixIcon: Icons.arrow_drop_down,
                      //   containerPadding: const EdgeInsets.all(10),
                      //   icon: const Icon(Icons.person, color: Colors.black),
                      //   onOptionSelected: (optionItem) {
                      //   optionItemSelectedgender =  optionItem;
                      //     setState(() {});
                      //   },
                      // ),
                        
                          
                           
                          
                      // //   FormHelper.dropDownWidget(
                      // //  context,
                      // //  "select ",
                      // //  this.genderId,
                      // //  this.gender,
                      // //  (onChangedVal){
                        
                      // //   this.genderId = onChangedVal;
                      // //   print("selected category: $onChangedVal");
                          
                      // //  },
                      // //  (onValidateVal){
                      // //   if (onValidateVal == null){
                      // //     return 'please select gender';
                      // //   }
                      // //   return null;
                      // //  },
                       
                       
                      // //  borderFocusColor: HexColor('#9B40CD'),
                      //  borderColor: Colors.black,
                      //  borderRadius: 10,
                      //  optionLabel: "name",
                      //  optionValue: "val",
                      //  paddingRight: 15
                      //  ),
                      //],
                       //),
                          
                          
                          
                      //                 Column(
                      // children: [
                      //   Padding(
                      //     padding: const EdgeInsets.only(left: 20,  top: 15, bottom: 5),
                      //     child: Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Text(
                      //             "City",
                      //             style:  GoogleFonts.notoSans(
                      //               fontSize: 15,
                      //               color: Colors.black
                                    
                      //             ),
                      //       ),
                      //     ),
                      //   ),
                        
                          
                      //   SearchDropList(
                      //   //key:_dropdowncity,
                      //   itemSelected: optionItemSelected,
                      //   dropListModel: dropListModelCity,
                      //   showIcon: false,
                      //   showArrowIcon: true,
                      //   showBorder: true,
                      //   textEditingController: citycontroller,
                      //   paddingTop: 0,
                      //   suffixIcon: Icons.arrow_drop_down,
                      //   containerPadding: const EdgeInsets.all(10),
                      //   icon: const Icon(Icons.person, color: Colors.black),
                      //   onOptionSelected: (optionItem) {
                      //     optionItemSelected = optionItem;
                      //     if (kDebugMode) {
                      //       print(optionItemSelected.id);
                      //     }
                      //     setState(() {
                            
                      //     });
                      //   },
                      // ),
                          
                          
                      // //   FormHelper.dropDownWidget(
                      // //  context,
                      // //  "Select, Saudi Arabia ",
                      // //  this.cityId,
                      // //  this.city,
                      // //  (onChangedVal){
                        
                      // //   this.cityId = onChangedVal;
                      // //   print("selected category: $onChangedVal");
                          
                      // //  },
                      // //  (onValidateVal){
                      // //   if (onValidateVal == null){
                      // //     return 'please select city';
                      // //   }
                      // //   return null;
                      // //  },
                       
                       
                      // //  borderFocusColor: HexColor('#9B40CD'),
                      // //  borderColor: Colors.black,
                      // //  borderRadius: 10,
                      // //  optionLabel: "name",
                      // //  optionValue: "val",
                      // //  paddingRight: 15
                      // //  ),
                      // ],
                      //  ),
                     
                    
                          
                     
                           
                          
                          
                          
                          
                    ],
                  ),
                
                
                
                ),
              ),
            ),
          ),
           SizedBox(height: 50,),
          Padding(
                             padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                             child: SizedBox(
                              height: 60,
                               child: ElevatedButton(
                                
                                style: ElevatedButton.styleFrom(
                                  
                                                      backgroundColor:HexColor('#4453ce'), 
                                                     shape: RoundedRectangleBorder( //to set border radius to button
                                                     borderRadius: BorderRadius.circular(10)
                                                     ),
                                                   padding: const EdgeInsets.all(20),
                                                    ),onPressed:() {
                                                       if (formKey.currentState!.validate())
                                                       { 
          
                                                        validateUserNum();
                                                      //   Navigator.pushReplacement(
                                                      //   context,
                                                      //  MaterialPageRoute(
                                                      //  builder: (_) => const HomeScreen(),));
                                                        }
                                                       else{_displayErrorMotionToast();}
                                                    },
                                                                                            
                       
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
            
                          /////////////privecy
                          ///
                        Padding(
                        padding:  const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:6),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                      "By continuing you agree to the ",
                                      style:  GoogleFonts.notoSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black
                                        
                                      ),
                                ),
                              ),
                            ),
            ////////////////////////start row
            
            
                             Padding(
                               padding: const EdgeInsets.only( left:20),
                               child: Row(
                                 children: [
                             
                                   TextButton( onPressed: () {
                                           Navigator.pushReplacement(
                                                     context,
                                                     MaterialPageRoute(
                                    builder: (_) => const HomeScreen(),
                                                     ),
                                                   );
                                            }, child: Text('Terms and Conditions', selectionColor: HexColor('#9B40CD') ,
                                             style:  GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color:  HexColor('#4453CE'),
                                                  fontWeight:  FontWeight.w600,
                                                    
                                                  
                                                ),
                                            ),
                                            ),
                                  
                                   Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                          "of the ",
                                          style:  GoogleFonts.notoSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black
                                            
                                          ),
                                    ),
                                                 ),
            
            
                                             TextButton( onPressed: () {
                                           Navigator.pushReplacement(
                                                     context,
                                                     MaterialPageRoute(
                                    builder: (_) => const HomeScreen(),
                                                     ),
                                                   );
                                            }, child: Text('Privacy Policy', selectionColor: HexColor('#9B40CD') ,
                                             style:  GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color:  HexColor('#4453CE'),
                                                  fontWeight:  FontWeight.w600,
                                                   
                                                  
                                                  
                                                ),
                                            ),
                                            ),
                                      
            
            
                                 ],
                               ),
                             ),
            
            
            
            
            
                          ],
                        ),
            
                        
                      ),
        ],
      )
    
    );
  }
}