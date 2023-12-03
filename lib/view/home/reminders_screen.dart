import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import '../category/categoryItem.dart';
import '../settings/reminders_setup_screen.dart';

//import 'bottom_bar.dart';


class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {



Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

   List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    // Initialize some dummy categories
    categories = [
      Category(name: 'AC', items: [], date:''),
      Category(name: 'Washing machine',items: [], date:'month'),
      Category(name: 'iphone 15', items: [], date:'two weeks'),
      Category(name: 'TV', items: [], date:''),
    ];
   
  }

   
   // This list holds the data for the list view
 



  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
       appBar: AppBar(
        leading: const BackButton(
         color: Colors.black,),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Text(
          'REMINDERS',
          style:  GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, 
         
         actions: [
          

           IconButton(
            color: HexColor('#9B40CD'),
            onPressed: () => {
                    const RemindersSetUp(), 
            }, 
            icon: const Icon(Icons.add, size: 20),
           
          ),


        ],// like this!
        
      ), 


      body: Container(
        child: SingleChildScrollView(
          child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Slidable(
                        key: Key('$categories'),
        
                       
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                             
                              SlidableAction(
                                onPressed: (context) {
                                  setState(() {
                                   categories.removeAt(index);
                                  });
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
        
                        child: Padding(
                          padding: const EdgeInsets.only(left:7.0, right: 7, top: 5, bottom:5),
                          child: ListTile(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ItemListScreen(category: categories[index]),
                              //   ),
                              // );
                            },
                        
                              
                            
                            leading: CircleAvatar(
                              backgroundColor: getRandomColor(),
                            ),
                           title: Row(
                             children: [
                               Text(categories[index].name),
                                SizedBox(
                                  width: 9,
                                ),

                               Text(
                                
                                'expires in a'
                                 +categories[index].date,

                                 style: TextStyle(color: Color.fromARGB(255, 194, 35, 35), fontSize: 14.0,  )
                                 
                                  ),


                             ],
                           ),
                        trailing: Icon(Icons.info_outline_rounded,  color: HexColor('#4453CE')),
                        
                            
                          ),
                        ),
                      ),
                    );
            
                    
                  },
                      ),
        ),
      ),





           bottomNavigationBar: BottomAppBar(
          height: 60.0,
          color: HexColor('#9B40CD'),
          shape: CircularNotchedRectangle(),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             IconButton(
              onPressed: () => Navigator.pushNamed(context, 'home_screen'),
               icon: Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255),)),
               IconButton(
             onPressed: () => Navigator.pushNamed(context, 'search_screen'),
               icon: Icon(Icons.search, color: Colors.white,)),
               IconButton(
              onPressed: () => Navigator.pushNamed(context, 'feedBack_screen'),
               icon: Icon(Icons.question_answer, color: Colors.white,)),
               IconButton(
              onPressed: () => Navigator.pushNamed(context, 'settings_screen'),
               icon: Icon(Icons.settings_outlined, color: Colors.white,)),
              
          ],)
       ),
       floatingActionButtonLocation:
           FloatingActionButtonLocation.miniCenterDocked,
       floatingActionButton: FloatingActionButton(
       backgroundColor: HexColor('#4453CE') ,
           splashColor: Colors.grey,
           tooltip: 'Add Warranty',
           child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
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
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to remember?'),
                    ),
                    SizedBox(
                      width: 320.0,
                      child:  ElevatedButton(
                        
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });

          },
         ),
      
    );
  }
}
