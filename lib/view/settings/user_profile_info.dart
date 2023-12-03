import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

//import 'bottom_bar.dart';


class UserProfileInfo extends StatefulWidget {
  const UserProfileInfo({super.key});

  @override
  State<UserProfileInfo> createState() => _UserProfileInfoState();
}

class _UserProfileInfoState extends State<UserProfileInfo> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () => {

            },
          icon: const Icon(Icons.account_circle_outlined),
          //color: kPrimaryColor,
          ),
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Container(
          width: 40,
          child: const Image(image: AssetImage('assets/images/logo_damanati2.png')),
          ),
         centerTitle: true, // like this!
        actions: [
          

           IconButton(
            //color: kPrimaryColor,
            onPressed: () => {

            }, 
            icon: const Icon(Icons.notifications),
           
          ),


        ],
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 50,
          ),
          
        ],
       )),
      
    );
  }
}
