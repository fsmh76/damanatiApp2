import 'package:flutter/material.dart';

//import 'bottom_bar.dart';


class WarrantyDetails extends StatefulWidget {
  const WarrantyDetails({super.key});

  @override
  State<WarrantyDetails> createState() => _WarrantyDetailsState();
}

class _WarrantyDetailsState extends State<WarrantyDetails> {
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
       //bottomNavigationBar: BottomBar(),
    );
  }
}
