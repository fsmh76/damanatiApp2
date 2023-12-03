
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'dart:io' show File, Platform;
//import 'dart:html' as html;
//import 'package:damaanati_ft/view/drafts/bottom.nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart'as http;

import '../../api_connection/api_connaction.dart';

class SetAvatar extends StatefulWidget {
  const SetAvatar({super.key});

  @override
  State<SetAvatar> createState() => _SetAvatarState();
}

class _SetAvatarState extends State<SetAvatar> {

  File? _imagepath;
  String? imagename;
  String? imagedata;
  //ImagePicker? imagePicker;

   Future<void>uploadimage()async {

    try
    {
      var res = await http.post(
        Uri.parse(API.setAvatar),
        body: 
        {

          'data': imagedata,
          'name':imagename,


        }

        
        
        //_imagepath.toJson()

      );
      if(res.statusCode == 200)
      {
        var resBodyOfSetAvatar = jsonDecode(res.body);
        if(resBodyOfSetAvatar['avataradded'])
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

 Future<void> _pickImage()async {
  final getimage = await ImagePicker().pickImage(source: ImageSource.gallery);
  
  setState(() {
    _imagepath = File(getimage!.path);
     imagename = getimage.path.split('/').last;
     imagedata = base64Encode(_imagepath!.readAsBytesSync());

    print(_imagepath);
    
  });
  
 }






   final placeholderImageUrl =
     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaYAvsj5zJqb6jSNdlX8R6M2_LDR05IJSPabWMFc_SMCDemb2R5b5kveXi99LCif7saKc&usqp=CAU";


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




  @override
  Widget build(BuildContext context) {
    

    return Scaffold(

        appBar: AppBar(
        leading: const BackButton(
         color: Colors.black,),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Text(
          'Set Avatar',
          style:  GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, // like this!
        
      ),
      


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
              SizedBox(
                height: 15,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                                      ClipOval(
                                  child: SizedBox(
                                     width: 200, // Adjust the width and height according to your needs
                                     height: 200,
                                     child:
                                     _imagepath != null
                                      ? kIsWeb
                                          ? Image.network(_imagepath!.path, fit: BoxFit.cover)
                                          :Image.file(_imagepath!, fit: BoxFit.cover)
                                     : Image.network(placeholderImageUrl, fit: BoxFit.cover),

                                     
                                  //     _image != null
                                  //        ? kIsWeb
                                  //   ? Image.network(_image!.path, fit: BoxFit.cover)
                                  // : Image.file(_image!, fit: BoxFit.cover)
                                  // : Image.network(placeholderImageUrl, fit: BoxFit.cover),
                           ),
                           ),

                          ],
                        ),
                        // width: 200,
                        // height: 200,
                        // decoration: BoxDecoration(
                        //     border: Border.all(
                        //         width: 4,
                        //         color: Theme.of(context).scaffoldBackgroundColor),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           spreadRadius: 2,
                        //           blurRadius: 10,
                        //           color: Colors.black.withOpacity(0.1),
                        //           offset: Offset(0, 10))
                        //     ],
                        //     shape: BoxShape.circle,
                        //     image: const DecorationImage(
                        //         fit: BoxFit.cover,
                        //         image: NetworkImage(
                        //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaYAvsj5zJqb6jSNdlX8R6M2_LDR05IJSPabWMFc_SMCDemb2R5b5kveXi99LCif7saKc&usqp=CAU",
                        //         ))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              
                              color: Colors.white, 
                              onPressed: 
                               _pickImage,
                              //_pickImage,
                              icon: Icon(Icons.add_a_photo),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
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
                                        ),
                                        onPressed:(){
                                          setState(() {
                                            uploadimage();
                                          });
                                              // Navigator.push(
                                              //  context,
                                              //  MaterialPageRoute(
                                              //  builder: (context) => HomeNavBar(),
                                              //  ),
                                              // );

                                            }, 
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
        
    );
  }
}



