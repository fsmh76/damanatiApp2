import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';


//import 'bottom_bar.dart';


class RemindersSetUp extends StatefulWidget {
  const RemindersSetUp({super.key});

  @override
  State<RemindersSetUp> createState() => _RemindersSetUpState();
}

class _RemindersSetUpState extends State<RemindersSetUp> {

   bool? check1 = false, check2 = false, check3 = false,  check4 = false, check5 = false;
  //true for checked checkbox, flase for unchecked one

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
          'REMINDER SETUP',
          style:  GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, 
        
      ),// APPBAR END


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
                 padding: const EdgeInsets.only(left: 20,  top: 1, bottom: 15),
                 child: Align(
                             alignment: Alignment.centerLeft,
                             child: Expanded(child: Text(
                              
                                  "we will send you a notification about the item expiry on the following schedule",
                                  style:  GoogleFonts.notoSans(
                                    fontSize: 12,
                                    color: Colors.black
                                    
                                    
                                  ),
                             )),
                             
                             
                 ),
               ),
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
                        "item",
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

              Padding(
              padding: const EdgeInsets.only(left: 9, right: 36,  top: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                   
                   Icon(Icons.access_time, size: 15.0), 
                  
                   
                  
                    
                         Align(
                           alignment: Alignment.centerLeft,
                           child: Text(
                            
                                "Reminder Period",
                                style:  GoogleFonts.notoSans(
                                  fontSize: 14,
                                  color: Colors.black
                                  
                                  
                                ),
                                                
                                               
                                           ),
                         ),
                 


                 Align(
                   alignment: Alignment.centerLeft,
                   child: Text(
                                "(Choose one or more options)",
                                style:  GoogleFonts.notoSans(
                                  fontSize: 12,
                                  color: Colors.black
                                  
                                ),
                          ),
                 ),



                ],
              ),
            ),
////////////////////////row end


           Padding(
             padding: const EdgeInsets.only(left: 10, ),
             child: Container(
              padding: EdgeInsets.only(left: 5,  top: 1, bottom: 5),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
           
                  CheckboxListTile( //checkbox positioned at left
                      value: check1,
                      
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {  
                          setState(() {
                              check1 = value;
                          });
                      },
                      title: Text("1 month before the expiry date",
                      style: TextStyle(fontSize: 14)),
                    ),
           
                  CheckboxListTile( //checkbox positioned at left
                      value: check2,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {  
                          setState(() {
                              check2 = value;
                          });
                      },
                     title: Text("1 week befor the expiry date",
                      style: TextStyle(fontSize: 14)),
                    ),
           
                  CheckboxListTile( //checkbox positioned at left
                      value: check3,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {  
                          setState(() {
                              check3 = value;
                          });
                      },
                      title: Text("1 day befor the expiry date",
                      style: TextStyle(fontSize: 14)),
                    ), 
           
                   CheckboxListTile( //checkbox positioned at left
                      value: check4,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value) {  
                          setState(() {
                              check4 = value;
                          });
                      },
                      title: Text("on the expiry date",
                      style: TextStyle(fontSize: 14)),
                    ),
           
                    // CheckboxListTile( //checkbox positioned at left
                    //   value: check5,
                    //   controlAffinity: ListTileControlAffinity.leading,
                    //   onChanged: (bool? value) {  
                    //       setState(() {
                    //           check5 = value;
                    //       });
                    //   },
                    //  title: Text("every 2 day/days after the expiry date",
                    //   style: TextStyle(fontSize: 14)),
                    // ),
           
              ],)
                     ),
           ),


             Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 15, bottom: 5, right: 230),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                   
                   Icon(Icons.repeat, size: 15.0), 
                  
                   
                  
                    
                         Align(
                           alignment: Alignment.centerLeft,
                           child: Text(
                            
                                "Repeat",
                                style:  GoogleFonts.notoSans(
                                  fontSize: 14,
                                  color: Colors.black
                                  
                                  
                                ),
                                                
                                               
                                           ),
                         ),
                 


            


                ],
              ),
             ),
//////////////////////////////bottons
                     

                    Padding(
                      padding: const EdgeInsets.only(left: 20,  top: 1, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                             padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: (){},
                                child: const Text('Once a day')),
                            ),
                          ),
                    
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: (){},
                                child: const Text('twice a day')),
                            ),
                          ),
                    
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: (){},
                                child: const Text('thrice a day')),
                            ),
                          ),
                    
                        ],
                      ),
                    )


            ],
             ),

      
      
                Padding(
                  padding: const EdgeInsets.only(left:20, right: 20, bottom: 10, top: 5 ),
                  child: const SizedBox(height: 20),
                ),
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
                                        ),onPressed: () => Navigator.pushNamed(context, 'addwarranty_screen'),
                                            child:  Text(
                                            "Submite ",
                                            style:  GoogleFonts.notoSans(
                                             fontSize: 15,
                                             fontWeight: FontWeight.w400,
                                             color: const Color.fromARGB(255, 255, 255, 255),
                          
                                                ),
                                             ),)
                ),


          ],
        ),
      ),
    )

    
       
     );
   }
 }


    // Padding(
    //           padding: const EdgeInsets.only(left: 20, right: 20,  top: 15, bottom: 5),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
    //             children: [
                   
    //               Expanded(
    //                child: Icon(Icons.access_time, size: 10.0), 
    //               ),
            
    //               Expanded(
    //                 child: Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: Text(
    //                           "Reminder Period",
    //                           style:  GoogleFonts.notoSans(
    //                             fontSize: 10,
    //                             color: Colors.black
                                
    //                           ),
    //                     ),
    //                   ),
    //               ),
                   
    //                 Expanded(
                    
    //                     child: Text(
    //                           "Reminder Period",
    //                           style:  GoogleFonts.notoSans(
    //                             fontSize: 10,
    //                             color: Colors.black
                                
    //                           ),
    //                     ),
                      
    //               ),
                 


    //              Text(
    //                           "(Choose one or more options)",
    //                           style:  GoogleFonts.notoSans(
    //                             fontSize: 8,
    //                             color: Colors.black
                                
    //                           ),
    //                     ),



    //             ],
    //           ),
    //         ),
      
      
      
    