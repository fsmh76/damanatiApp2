//import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
//import '../constants.dart';
//import 'bottom_bar.dart';


class AddWarranty extends StatefulWidget {
  @override
  _AddWarrantyState createState() => _AddWarrantyState();
  
}


class _AddWarrantyState extends State<AddWarranty> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  TextEditingController _date = TextEditingController();

  List<dynamic> category= [];
  String? categoryId;

 @override
 void initState(){
  super.initState();

 this.category.add({"val": "1", "name": "Simple"});
 this.category.add({"val": "2", "name": "Variable"});

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
          'ADD WARRANTY',
          style:  GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, // like this!
        
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          

          //category dropdown
             Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 1, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Category",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.black
                          
                        ),
                  ),
                ),
              ),
              


              FormHelper.dropDownWidget(
             context,
             "select ",
             this.categoryId,
             this.category,
             (onChangedVal){
              
              this.categoryId = onChangedVal;
              print("selected category: $onChangedVal");

             },
             (onValidateVal){
              if (onValidateVal == null){
                return 'please select category';
              }
              return null;
             },
             
             
             borderFocusColor: HexColor('#9B40CD'),
             borderColor: Colors.black,
             borderRadius: 10,
             optionLabel: "name",
             optionValue: "val",
             paddingRight: 15
             ),
            ],
             ),
            
            //purches date dropdown

              Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 15, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Purches Date",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),
              ),
              


            FormHelper.dropDownWidget(
             context,
             "select ",
             this.categoryId,
             this.category,
             (onChangedVal){
              
              this.categoryId = onChangedVal;
              print("selected category: $onChangedVal");

             },
             (onValidateVal){
              if (onValidateVal == null){
                return 'please select a date';
              }
              return null;
             },
             
             
             borderFocusColor: HexColor('#9B40CD'),
             borderColor: Colors.black,
             borderRadius: 10,
             optionLabel: "name",
             optionValue: "val",
             paddingRight: 15
             ),
            ],
             ),

              //pur

            
            //   TextField(
            //     controller: _date,

            //     decoration: InputDecoration(
            //       icon: Icon(Icons.calendar_today_rounded),
            //       labelText: "select Date",
            //     enabledBorder: OutlineInputBorder(
            //     borderSide:
            //     BorderSide(
            //     width: 5, //<-- SEE HERE
            //    color:HexColor('#9B40CD'),
            //    ),
            //    borderRadius: BorderRadius.circular(30.0),

            //      ),
            //  ),
                
            //     onTap: ()async{
            //       DateTime? pickeddate = await showDatePicker(
            //        context: context,
            //        initialDate: DateTime.now(),
            //        firstDate: DateTime(2000),
            //        lastDate: DateTime(2101),
            //   );
            //     if (pickeddate != null){
            //        setState((){

            //         _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
            //        });
            //     }

            //   },
            //   ),
              
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,  top: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                   
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      cursorColor: HexColor('#4453CE'),
                      controller: _date,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _date.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        icon: const Icon(Icons.calendar_today_rounded),
                        labelText: "start Date",
                        hintText: "select",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  const BorderSide(color: Colors.black45),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: HexColor('#9B40CD')),
                        ),
                        
                      ),
                      onTap: ()async{
                      DateTime? pickeddate = await showDatePicker(
                       context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2000),
                       lastDate: DateTime(2101),
                                );
                    if (pickeddate != null){
                       setState((){
                  
                        _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                       });
                    }
                  
                                },
                    ),
                  ),
            
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      cursorColor: HexColor('#4453CE'),
                      controller: _date,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _date.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        icon: const Icon(Icons.calendar_today_rounded),
                        labelText: "End Date",
                        hintText: "select",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  const BorderSide(color:Colors.black45),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: HexColor('#9B40CD')),
                        ),
                        
                      ),
                      onTap: ()async{
                      DateTime? pickeddate = await showDatePicker(
                      
                       context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2000),
                       lastDate: DateTime(2101),
                                );
                    if (pickeddate != null){
                       setState((){
                  
                        _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                       });
                    }
                  
                                },
                    ),
                  ),
                   
            
                ],
              ),
            ),


              //invoice 
              Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "invoice ",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),

                
              ),
              
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                       initialValue: 'Scan or Attach',
                       decoration:  InputDecoration(
                        suffixIcon: IconButton(
                       icon: const Icon(Icons.camera),
                       onPressed: () {
                         
                         showModalBottomSheet(context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              child: Column(children: [
                                
                                Expanded(
                                  flex: 5,
                                     child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#4453CE'), //background color of button
                                        side: const BorderSide(width:3, color:Color.fromARGB(255, 186, 184, 184)), //border width and color
                                        elevation: 3, //elevation of button
                                         shape: RoundedRectangleBorder( //to set border radius to button
                                         borderRadius: BorderRadius.circular(30)
                                         ),
                                       padding: const EdgeInsets.all(20) //content padding inside button
                                        ),
                                       onPressed: (){ 
                                       //code to execute when this button is pressed.
                                           }, 
                                         icon:  const Icon(Icons.camera, color: Color.fromARGB(115, 78, 77, 77), size: 30,),
                                        label: Text(
                                            "Select From Gallary ",
                                            style:  GoogleFonts.notoSans(
                                             fontSize: 30,
                                             fontWeight: FontWeight.w500,
                                             color: const Color.fromARGB(255, 255, 255, 255),
                          
                                                ),
                                             ),
                                         
                                     ),
                                  ),
                                
                                  
                                 Expanded(
                                  flex: 5,
                                    
                                       child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#4453CE'), //background color of button
                                        side: const BorderSide(width:3, color:Color.fromARGB(255, 186, 184, 184)), //border width and color
                                        elevation: 3, //elevation of button
                                         shape: RoundedRectangleBorder( //to set border radius to button
                                         borderRadius: BorderRadius.circular(30)
                                         ),
                                       padding: const EdgeInsets.all(20) //content padding inside button
                                        ),
                                       onPressed: (){ 
                                       //code to execute when this button is pressed.
                                           }, 
                                        icon:  const Icon(Icons.camera, color: Color.fromARGB(115, 78, 77, 77), size: 30,),
                                        label: Text(
                                            "Scan document ",
                                            style:  GoogleFonts.notoSans(
                                             fontSize: 30,
                                             fontWeight: FontWeight.w500,
                                             color: const Color.fromARGB(255, 255, 255, 255),
                          
                                                ),
                                             ),
                                         
                                     ),

                                   ),
                                

                                 
                                 
                              ]),

                              
                            );
                          },
                          );
                      },
                     ),
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

             // notes 
               Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Notes ",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),

                
              ),
              
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                       initialValue: 'Write Something...',
                       decoration:  InputDecoration(
                        
                        suffixIcon: IconButton(
                       icon: const Icon(Icons.camera),
                       onPressed: () {
                         
                         showModalBottomSheet(context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              child: Column(children: [
                                
                                Expanded(
                                  flex: 5,
                                     child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#4453CE'), //background color of button
                                        side: const BorderSide(width:3, color:Color.fromARGB(255, 186, 184, 184)), //border width and color
                                        elevation: 3, //elevation of button
                                         shape: RoundedRectangleBorder( //to set border radius to button
                                         borderRadius: BorderRadius.circular(30)
                                         ),
                                       padding: const EdgeInsets.all(20) //content padding inside button
                                        ),
                                       onPressed: (){ 
                                       //code to execute when this button is pressed.
                                           }, 
                                         icon:  const Icon(Icons.camera, color: Color.fromARGB(115, 78, 77, 77), size: 30,),
                                        label: Text(
                                            "Select From Gallary ",
                                            style:  GoogleFonts.notoSans(
                                             fontSize: 30,
                                             fontWeight: FontWeight.w500,
                                             color: const Color.fromARGB(255, 255, 255, 255),
                          
                                                ),
                                             ),
                                         
                                     ),
                                  ),
                                 const Spacer(
                                  flex: 1,
                                 ),
                                  
                                 Expanded(
                                  flex: 5,
                                    
                                       child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#4453CE'), //background color of button
                                        side: const BorderSide(width:3, color:Color.fromARGB(255, 186, 184, 184)), //border width and color
                                        elevation: 3, //elevation of button
                                         shape: RoundedRectangleBorder( //to set border radius to button
                                         borderRadius: BorderRadius.circular(30)
                                         ),
                                       padding: const EdgeInsets.all(20) //content padding inside button
                                        ),
                                       onPressed: (){ 
                                       //code to execute when this button is pressed.
                                           }, 
                                        icon:  const Icon(Icons.camera, color: Color.fromARGB(115, 78, 77, 77), size: 30,),
                                        label: Text(
                                            "Scan document ",
                                            style:  GoogleFonts.notoSans(
                                             fontSize: 30,
                                             fontWeight: FontWeight.w500,
                                             color: const Color.fromARGB(255, 255, 255, 255),
                          
                                                ),
                                             ),
                                         
                                     ),

                                   ),
                                

                                 
                                 
                              ]),

                              
                            );
                          },
                          );
                      },
                     ),
                          
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

                        ////////////// warranty provider
               Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Warranty Provider/Shop Name ",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),

                
              ),
              
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                       initialValue: 'Enter Name',
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






                        ////////////// warranty contact
               Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Warranty contact name",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),

                
              ),
              
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                       initialValue: 'Enter Name',
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




                        ////////////// warranty contact number
               Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Warranty contact number ",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          
                        ),
                  ),
                ),

                
              ),
              
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                      borderSide:  const BorderSide(color: Colors.black45),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:HexColor('#9B40CD')),
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
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 98, 97, 97),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    
                  ),
                  ),
                ),
                
                  ),

            ],
             ),

             
             //button
             const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#4453CE'), //background color of button
                                        
          
                                         shape: RoundedRectangleBorder( //to set border radius to button
                                         borderRadius: BorderRadius.circular(10)
                                         ),
                                       padding: const EdgeInsets.all(20),
                                        ),onPressed: () => Navigator.pushNamed(context, 'bottom_bar'),
                                            child:  Text(
                                            "Submite ",
                                            style:  GoogleFonts.notoSans(
                                             fontSize: 15,
                                             fontWeight: FontWeight.w400,
                                             color: const Color.fromARGB(255, 255, 255, 255),
                          
                                                ),
                                             ),)
                ),



           //
          ],
        ),
      ),
    )
    );
      
      
      
  }
}