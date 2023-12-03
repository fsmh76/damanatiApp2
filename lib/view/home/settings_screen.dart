import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/hex_color.dart';
//import '../constants.dart';
//import 'bottom_bar.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        leading:  Container(
          width: 40,
          child: const Image(image: AssetImage('assets/images/logo_damanati2.png')),
          ),

        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title:Text(
          'SETTINGS',
          style:  GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, // like this!
        actions: [
          

           IconButton(
            color: HexColor('#9B40CD'),
            onPressed: () => {

            }, 
            icon: const Icon(Icons.notifications),
           
          ),


        ],
      ),
      body: Container(
        padding: const EdgeInsets.only( top: 30),
        child: Column(
          children: [
            //profile
                  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 1, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "My Profile",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.black
                          
                        ),
                  ),
                ),
              ),

             const SizedBox(
                 height: 10,
                ),
               
                   ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Colors.black,
                  
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
               
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),
               



            ]
                  ),
            ///// setup
            
                  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 15, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "Setup",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.black
                          
                        ),
                  ),
                ),
              ),

             const SizedBox(
                 height: 10,
                ),
               ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () => Navigator.pushNamed(context, 'reminders_screen'),
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),



            ]
                  ),






                  ///// General
            
                  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,  top: 15, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                        "General",
                        style:  GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.black
                          
                        ),
                  ),
                ),
              ),
            ///1
             const SizedBox(
                 height: 10,
                ),
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),
               ///2
               const SizedBox(
                 height: 10,
                ),
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),

              ///3
              const SizedBox(
                 height: 10,
                ),
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),

              ///4
              const SizedBox(
                 height: 10,
                ),
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),


              ///5
              const SizedBox(
                 height: 10,
                ),
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45),
                
                ),
              ),

              ///6
              const SizedBox(
                 height: 10,
                ),
               ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                   borderRadius: BorderRadius.circular(0)),
                  shadowColor: Color.fromARGB(255, 125, 124, 124),
                 backgroundColor: Color.fromARGB(255, 232, 232, 233),
                 minimumSize: const Size.fromHeight(45), // NEW
               ),
                onPressed: () {},
                child: const Text(
                'Reminders Setup',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15, color: Colors.black45 ),
                
                ),
              ),
              





            ]
                  )



            
             




          ],
        ),
      ),

      
    );
  }
}
