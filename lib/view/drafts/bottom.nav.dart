/*
 *  Copyright 2020 chaobinwu89@gmail.com
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:damaanati_ft/view/home/feedBack_screen.dart';
import 'package:damaanati_ft/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:damanati_app/view/avatar.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../home/addWarranty_screen.dart';
import '../home/search_screen.dart';
import '../home/settings_screen.dart';
import 'dialog.dart';
class HomeNavBar extends StatefulWidget  {
  const HomeNavBar({super.key});


@override
  _HomeNavBarState createState() => _HomeNavBarState();
}
class _HomeNavBarState extends State<HomeNavBar> {

  

  int selectedPage = 0;
  final _pageOptions = [HomeScreen(),  Search(),ShowDialog(), FeedBack(), Settings()];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: _pageOptions[selectedPage],
      
   bottomNavigationBar: ConvexAppBar(
        
        backgroundColor: HexColor('#9B40CD'),
        style: TabStyle.fixedCircle,
        cornerRadius: 25,
        height: 60,
        curveSize: 100,
        items: [
          TabItem(icon: Icons.home, title: '.'),
          TabItem(icon: Icons.search_outlined, title: '.'),
          TabItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HexColor('#4453CE'),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 40),
            )
          ),
          TabItem(icon: Icons.question_answer, title: '.'),
          TabItem(icon: Icons.settings_outlined, title: '.'),
        ],

        

      
        initialActiveIndex: 0,//optional, default as 0
          onTap: (int i ){
            setState(() {
              selectedPage = i;
            });
          },




          
        onTabNotify: (i) {
        var intercept = i ==2;
        if (intercept) {
         

            showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
             
              side: BorderSide(color:HexColor('#4453CE'), width: 1.3),
                borderRadius:
                    BorderRadius.circular(20.0)),
                   
                    //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                                    Align(
                  alignment: Alignment.center,
                  child: Text(
                        "Select Category",
                        style:  GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                          
                        ),
                  ),

                                    ),
                                    SizedBox(height: 20,),
                    
                    SizedBox(
                      height: 60,
                      child:  ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          
                                              backgroundColor: HexColor('#9B40CD'), //background color of button
                                            
                               
                                             shape: RoundedRectangleBorder( //to set border radius to button
                                             borderRadius: BorderRadius.circular(10)
                                             ),
                                           padding: const EdgeInsets.all(20),
                                            ),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWarranty()));
                                            },
                                                child:  Text(
                                                "Confirm ",
                                                style:  GoogleFonts.notoSans(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w500,
                                                 color: const Color.fromARGB(255, 255, 255, 255),
                              
                                                    ),
                                                ),
                    )
                    ),
                  ],
                ),
              ),
            ),
          );
        });

  }

    return !intercept;
  
  }
        
      ),


      
         
      
    );

    
  }
}





// Container(
              
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [

//                     SizedBox(height: 30),


//                     //category dropdown
            
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                         "SELECT CATEGORY",
//                         style:  GoogleFonts.notoSans(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,

                          
//                         ),
//                   ),
//                 ),

//                 SizedBox(
//                     height: 30,
//                    ),
             
              


//             FormHelper.dropDownWidget(
//              context,
//              "select ",
//              this.categoryId,
//              this.category,
//              (onChangedVal){
              
//               this.categoryId = onChangedVal;
//               print("selected category: $onChangedVal");

//              },
//              (onValidateVal){
//               if (onValidateVal == null){
//                 return 'please select category';
//               }
//               return null;
//              },
             
             
//              borderFocusColor: HexColor('#9B40CD'),
//              borderColor: Colors.black,
//              borderRadius: 10,
//              optionLabel: "name",
//              optionValue: "val",
//              paddingRight: 15
//              ),
            
             
            
//                    SizedBox(
//                     height: 30,
//                    ),
         
                                                    

//                     SizedBox(

//                       height: 60,
//                       child:  ElevatedButton(
                        
//                         style: ElevatedButton.styleFrom(
                          
//                                               backgroundColor: HexColor('#9B40CD'), //background color of button
                                            
                               
//                                              shape: RoundedRectangleBorder( //to set border radius to button
//                                              borderRadius: BorderRadius.circular(10)
//                                              ),
//                                            padding: const EdgeInsets.all(20),
//                                             ),
//                                             onPressed: (){
//                                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWarranty()));
//                                             },
//                                                 child:  Text(
//                                                 "Confirm ",
//                                                 style:  GoogleFonts.notoSans(
//                                                  fontSize: 18,
//                                                  fontWeight: FontWeight.w500,
//                                                  color: const Color.fromARGB(255, 255, 255, 255),
                              
//                                                     ),
//                                                  ),),
//                     ),

//                     SizedBox(height: 20),
//                   ],
//                 ),
              
//             ),