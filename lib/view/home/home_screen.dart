
import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:damaanati_ft/view/home/reminders_screen.dart';
import 'package:damaanati_ft/view/side_drawer/naviigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
import 'dart:math';
import '../category/category.dart';
import '../drafts/invoice.dart';
import '../drafts/invoice.model.dart';
import '../drafts/timeline.model.dart';
import 'dart:ui' as ui;




enum ListViewType {
  List1,
  List2,
  List3,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});






  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late File? imageFile; 
  final placeholderImageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaYAvsj5zJqb6jSNdlX8R6M2_LDR05IJSPabWMFc_SMCDemb2R5b5kveXi99LCif7saKc&usqp=CAU"; 


  // late BannerAd bannerAd;
  // bool isAdLoaded = false;
  // var adUnit = "ca-app-pub-3940256099942544/6300978111";

  // initBannerAd(){
  //   bannerAd = BannerAd(
  //     size: AdSize.banner, 
  //     adUnitId: adUnit,
  //      listener: BannerAdListener(
  //       onAdLoaded: (ad){
  //         setState((){
  //           isAdLoaded = true;

  //         }
  //         );
  //       },
  //       onAdFailedToLoad: (ad, error){
  //         ad.dispose();
  //         print(error);
  //       }
  //      ),
  //       request: AdRequest());

  //       bannerAd.load();
  // }

  TextEditingController categoryNameController = TextEditingController();

  

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
    // initBannerAd();
    categories = [
      Category(name: 'Electronics'),
      Category(name: 'Home Appliances'),
      Category(name: 'Books'),
    ];
    _datalist = _data;
    super.initState();
  }

  
  

  final List<Map<String, dynamic>> _data = [
    {"item": "phone", "category": "appliances", "purches_date": "21/2/2012", "start_date": "21/2/2012",'warrantyEndDate': "2026-03-10", 'warrantyContact': '1-800-989-1214','notes': 'This is a TV.','shopPicture': 'assets/images/1.jpg','invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "ac", "category": "electronics", "purches_date": "3/2/2020", "start_date": "3/2/2020", 'warrantyEndDate': "2026-03-09",'warrantyContact': '1-800-2938-1213','notes': 'This is a phone.','shopPicture': 'assets/images/3.jpg','invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "neckless", "category": "accessories", "purches_date":  "6/8/2019", "start_date": "6/8/2019",  'warrantyEndDate': "2026-03-10","warrantyContact": '1-800-3958-1214',"notes": 'This is a gadget.',"shopPicture": 'assets/images/2.jpg',"invoicePicture": 'assets/images/invoice.jpg'},
    {"item": "remote", "category": "gadgets", "purches_date": "8/5/2023", "start_date": "8/5/2023", 'warrantyEndDate': "2026-03-16", 'warrantyContact': '1-4857-555-1214','notes': 'This is a anything.','shopPicture': 'assets/images/1.jpg','invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "ball", "category": "sports", "purches_date": "20/1/2018", "start_date": "21/1/2018", 'warrantyEndDate': "2026-06-17", 'warrantyContact': '1-2746-555-1214','notes': 'This is a invoice.','shopPicture': 'assets/images/3.jpg','invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "car", "category": "automotive", "purches_date":" 2/12/2017", "start_date": "9/12/2017", 'warrantyEndDate': "2026-09-18", 'warrantyContact': '1-3674-555-1214','notes': 'This is whatever.','shopPicture': 'assets/images/2.jpg','invoicePicture': 'assets/images/invoice.jpg',},
    
  ];
   
   // This list holds the data for the list view
  List<Map<String, dynamic>> _datalist = [];
  

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _data;
    } else {
      results = _data
          .where((warranty) =>
              warranty["item"] || warranty["category"] ||warranty ["warrantyEndDate"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _datalist = results;
    });
  }



  Widget _getTitle() {
    
    switch (_currentListView) {
      case ListViewType.List1:
        return const Text('Warranty by Timeline', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold, ));
      case ListViewType.List2:
        return const Text('Warranty by item', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold));
      case ListViewType.List3:
        return const Text('Warranty by category', style: TextStyle(color: Colors.black , fontSize: 15.0, fontWeight: FontWeight.bold));
      default:
        return const Text('Warranty Timeline', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold));
    }
  }

  






  ListViewType _currentListView = ListViewType.List1;

  Widget _buildListView(ListViewType listViewType) {
    switch (listViewType) {
      case ListViewType.List1:
      void _showTaskDetailsDialog(BuildContext context, List<Task> tasksForDate) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tasks for Selected Date'),
          content: Column(
            children: tasksForDate
                .map((task) => ListTile(
                      title: Text(task.name),
                      subtitle: Text(task.description),
                    ))
                .toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
         DateTime? minDueDate;
    for (final task in tasks) {
      if (minDueDate == null || task.dueDate.isBefore(minDueDate)) {
        minDueDate = task.dueDate;
      }
    }

     if (minDueDate == null) {
      minDueDate = DateTime.now(); // If no tasks are present, use the current date
    }

    // Create a list of dates
    List<DateTime> dateList = [];
    DateTime currentDate = minDueDate;
    DateTime endDate = minDueDate.add(const Duration(days: 365));

    while (currentDate.isBefore(endDate)) {
      dateList.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    };
        return Center(
          child: Column(
            children: [

                    TextField(
                    onChanged: (value) => _runFilter(value),
                    cursorColor: const Color.fromARGB(255, 126, 125, 125),
                    decoration: const InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor:Color.fromARGB(255, 238, 238, 238),
                    labelText: 'filter', suffixIcon: Icon(Icons.filter_alt),
                    alignLabelWithHint: true,
                    hintTextDirection: ui.TextDirection.rtl,
                    contentPadding: EdgeInsets.only(bottom: 9.0),
                    
                    ),),

                 
                 ListView.builder(
        shrinkWrap: true,
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          final currentDate = dateList[index];
          final formattedDate = intl.DateFormat('dd MMMM yyyy').format(currentDate);
          List<Task> tasksForDate = tasks.where((task) {
            // Filter tasks that are due on the current date
            return task.dueDate.year == currentDate.year &&
                task.dueDate.month == currentDate.month &&
                task.dueDate.day == currentDate.day;
                
          }).toList();
         // Determine the text color based on whether tasks are present
         Color dateColor = tasksForDate.isNotEmpty ? Colors.blue : Colors.black;
         final valueColor = tasksForDate.isNotEmpty ? AlwaysStoppedAnimation(Colors.blue) : AlwaysStoppedAnimation(Colors.black) ;

           // Calculate the progress based on the current time
          final currentTime = DateTime.now();
          final totalSecondsInDay = 24 * 60 * 60;
          final elapsedSeconds = currentTime.hour * 60 * 60 + currentTime.minute * 60 + currentTime.second;
          final remainingSeconds = totalSecondsInDay - elapsedSeconds;

          final remainingHours = remainingSeconds ~/ 3600;
          final progress = (remainingHours / 24).clamp(0.0, 1.0);

          return Column(
            children: [
              ListTile(
                leading: Text(formattedDate, style:
                           GoogleFonts.notoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: dateColor,
                          
                        ),
                  
                        
                         ),
                title:
                   Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20,  top: 10, bottom: 10),
                      child: LinearProgressIndicator(
                                      minHeight: 3,
                                   value: progress,valueColor: valueColor
                      ),
                    ),
                  
                
                onTap: () {
                  // Show task info in a dialog only when there are tasks for the selected date
                  if (tasksForDate.isNotEmpty) {
                    
                    _showTaskDetailsDialog(context, tasksForDate);
                  }
                  
                },
              ),
            ],
          );
          
        },
        
      ),
      
        
             


            ],
          ),
        );
      case ListViewType.List3:
      ////////category
        return Container(

          child: Column(
            children: [
                 

                Padding(
              padding: const EdgeInsets.only(left: 10, right: 10,  top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                   
                  Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: TextButton.icon(
                        
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
              decoration: const InputDecoration(
                labelText: 'Category Name',
              ),
              controller: categoryNameController,
            ),
            
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  
                  String categoryName = categoryNameController.text.trim();
                  if (categoryName.isNotEmpty) {
                    Category newCategory = Category(name: categoryName);
                    Navigator.pop(context, newCategory);
                    categories.add(newCategory);
                      
                   
                  }

                 
                               
                  
                },
                child: const Text('Add'),
              ),
            ),
                  ],
                ),
              ),
            ),
          );
          
        });




                            }, 
                            
                            
                            icon:  Icon(Icons.add, size: 10, color: HexColor('#9B40CD')),
                            label: const Text('add category', style: TextStyle(fontSize: 14, color: Color.fromARGB(248, 54, 54, 54))),
                            
                         ),
                    ),
                    
                    
                  ),
            
                         Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: TextButton.icon(
                        
                        onPressed: () {
                           Navigator.push(
                            context,
                          MaterialPageRoute(
                          builder: (context) => AddCategoryScreen(),
                           ),
                         ).then((newCategory) {
                        if (newCategory != null) {
                      setState(() {
                                    categories.add(newCategory);
                                  });
                                }
                              });
                            }, 
                            
                            
                            icon:  Icon(Icons.filter, size: 10, color: HexColor('#9B40CD')),
                            label: const Text('filter', style: TextStyle(fontSize: 14, color: Color.fromARGB(248, 54, 54, 54))),
                            
                         ),
                    ),
                    
                    
                  ),
                   
            
                ],
              ),
            ),

              ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Slidable(
                    key: Key('$categories'),

                    startActionPane: ActionPane(
                        motion: const ScrollMotion(),
        
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.teal,
                            icon: Icons.share,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                _datalist.removeAt(index);
                              });
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.teal,
                            icon: Icons.share,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                _datalist.removeAt(index);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemListScreen(category: categories[index]),
                            ),
                          );
                        },
                    
                          shape: RoundedRectangleBorder(
                             side: const BorderSide(width: 2, color: Color.fromARGB(255, 20, 20, 19)),
                            borderRadius: BorderRadius.circular(10),
                    
                          ),
                        
                        leading: CircleAvatar(
                          backgroundColor: getRandomColor(),
                        ),
                        title: Text(categories[index].name),
                        trailing: Text('${categories[index].items.length}',),
                    
                        
                      ),
                    ),
                  ),
                );
        
                
              },
                  ),
            ],
          ),
        );




      case ListViewType.List2:
        return Container(
          child: Column(
            children: [
                       
                      TextField(
                    onChanged:  _runFilter,
                    cursorColor: const Color.fromARGB(255, 126, 125, 125),
                    decoration: const InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor:Color.fromARGB(255, 238, 238, 238),
                    labelText: 'filter', suffixIcon: Icon(Icons.filter_alt),
                    alignLabelWithHint: true,
                    hintTextDirection: ui.TextDirection.rtl,
                    contentPadding: EdgeInsets.only(bottom: 9.0),
                    
                    ),),



                           ////////////////////////////////
                           ///
                          ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Slidable(
                    key: Key('$items'),

                    startActionPane: ActionPane(
                        motion: const ScrollMotion(),
        
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.teal,
                            icon: Icons.share,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.teal,
                            icon: Icons.share,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                items.removeAt(index);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InvoicePage(item: items[index]),
                            ),
                          );
                        },
                    
                          shape: RoundedRectangleBorder(
                             side: const BorderSide(width: 2, color: Color.fromARGB(255, 20, 20, 19)),
                            borderRadius: BorderRadius.circular(10),
                    
                          ),
                        
                        leading: Expanded(child: Image.asset(items[index].itemPicture),),
                          title: Text(items[index].itemName),
                          subtitle: Text("expiry date: ${DateFormat('dd/MM/yyyy').format(items[index].endDate)}"),
                        ),
                       
                    
                        
                      ),
                    ),
                  );
                
        
                
              },
                  ),



                  

              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: _datalist.length,
              //   itemBuilder: (context, index) {
              //     final item = _datalist[index];
              //     //       OnTap:() {
              //     //   Navigator.pushNamed(context, 'warranty_details_screen', arguments: item);
              //     // };
              //     return Container(
              //       height: 80.0, ///listile height
              //       padding:  const EdgeInsets.symmetric(vertical: 5.0, horizontal:3.0 ),
                      
              //       child: Slidable(
              //         key: Key('$item'),
                      
              //         startActionPane: ActionPane(
              //           motion: const ScrollMotion(),
        
              //           children: [
              //             SlidableAction(
              //               onPressed: (context) {},
              //               backgroundColor: Colors.teal,
              //               icon: Icons.share,
              //             ),
              //             SlidableAction(
              //               onPressed: (context) {
              //                 setState(() {
              //                   _datalist.removeAt(index);
              //                 });
              //               },
              //               backgroundColor: Colors.red,
              //               icon: Icons.delete,
              //             ),
              //           ],
              //         ),
              //         endActionPane: ActionPane(
              //           motion: const ScrollMotion(),
              //           children: [
              //             SlidableAction(
              //               onPressed: (context) {},
              //               backgroundColor: Colors.teal,
              //               icon: Icons.share,
              //             ),
              //             SlidableAction(
              //               onPressed: (context) {
              //                 setState(() {
              //                   _datalist.removeAt(index);
              //                 });
              //               },
              //               backgroundColor: Colors.red,
              //               icon: Icons.delete,
              //             ),
              //           ],
              //         ),
              //         child: InkWell(
              //           onTap: () { 
              //           print("Click event on Container"); 
              //         },
              //           child: Container(
              //             margin: const EdgeInsets.symmetric(horizontal: 20.0),
              //             padding: const EdgeInsets.all(10.0),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10.0),
              //               color: Colors.white,
              //               boxShadow: [
              //                 BoxShadow(
              //                     blurRadius: 1.0,
              //                     spreadRadius: 1.0,
              //                     color: const Color.fromARGB(255, 37, 37, 37)!),
              //               ],
              //             ),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 ClipRRect(
                                
              //                   child: Image.asset(
              //                     item['shopPicture']!,
              //                     width: 100.0,
              //                     height: 100.0,
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //                 const SizedBox(width: 10.0),
              //                 Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
                                
                                
              //                   children: [
              //                     Text(
              //                       item['item']!,
              //                       style: const TextStyle(
              //                         fontSize: 15.0,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                     const SizedBox(height: 8.0),
              //                     Text('it will be expire on:'+
              //                       item['warrantyEndDate']!,
              //                       style: const TextStyle(
              //                         fontSize: 12.0,
              //                         color: Color.fromARGB(255, 132, 129, 129),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
                      
                      
              //       ),
                    
              //     );
              //   },
              // ),
            ],
          ),
        );
      default:
        return Container();
    }
  }




   Widget _buildAppBarLeading() {
  return GestureDetector(
    onTap: () {
      _scaffoldKey.currentState?.openDrawer();
    },
    child: Builder(
      builder: (BuildContext innerContext) {
        return imageFile != null
            ? CircleAvatar(
                backgroundImage: kIsWeb
                    ? NetworkImage(imageFile!.path) as ImageProvider<Object>?
                    : FileImage(imageFile!),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(placeholderImageUrl),
              );
      },
    ),
  );
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {



    
    // final AdWidget adWidget = AdWidget(
    //   ad: myBanner,
    // );
    // final Container adContainer= Container(child: adWidget,
    // width: myBanner.size.width.toDouble(),
    // height: myBanner.size.height.toDouble(),
    // );



       return Scaffold(
         key: _scaffoldKey,
        
       drawer:  NaviigationDrawer(context, imageFile: null,), // Assign the key to Scaffold.
        
        
        appBar: AppBar(
         leading:  _buildAppBarLeading(),
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Container(
          width: 40,
          child: const Image(image: AssetImage('assets/images/logo_damanati2.png')),
          ),
         centerTitle: true, // like this!
        actions: [
          

           IconButton(
            color: HexColor('#9B40CD'),
            onPressed: () => {
                    const Reminders(), 
            }, 
            icon: const Icon(Icons.notifications),
           
          ),


        ],
      ),
        body: Column(
          children: [
            Column(
              children: [

                // isAdLoaded? SizedBox(
                //   height: bannerAd.size.height.toDouble(),
                //   width: bannerAd.size.width.toDouble(),
                //   child: AdWidget(ad: bannerAd),

                // ) : const SizedBox(),

                //content(adContainer)
                 SizedBox(
                   height: 200,
                   child: Image.asset('assets/images/ads.jpg'),
                 ),
              ],
            ),
            AppBar(
              
              backgroundColor: const Color.fromARGB(255, 247, 246, 247),
              shadowColor: HexColor('#9B40CD'),
             leadingWidth: 0,
            title:   _getTitle(),
            centerTitle: false,
            
              
              actions: [
                IconButton(
                  color: const Color.fromARGB(255, 106, 106, 106),
                  splashColor: HexColor('#9B40CD'),
                  icon: const Icon(Icons.sync_alt),
                  iconSize: 18.0,
                  onPressed: () {
                    setState(() {
                      _currentListView = ListViewType.List1;
                    });
                  },
                ),
                IconButton(
                  color: const Color.fromARGB(255, 106, 106, 106),
                  splashColor: HexColor('#9B40CD'),
                  icon: const Icon(Icons.view_agenda),
                  iconSize: 18.0,
                  onPressed: () {
                    setState(() {
                      _currentListView = ListViewType.List2;
                    });
                  },
                ),
                IconButton(
                 color: const Color.fromARGB(255, 106, 106, 106),
                  splashColor: HexColor('#9B40CD'),
                  icon: const Icon(Icons.horizontal_split_outlined),
                  iconSize: 18.0,
                  onPressed: () {
                    setState(() {
                      _currentListView = ListViewType.List3;
                    });
                  },
                ),
              ],
            ),
                     Divider(
                          color: HexColor('#9B40CD'), //color of divider
                           height: 0, //height spacing of divider
                           thickness: 3, //thickness of divier line
                           indent: 0, //spacing at the start of divider
                           endIndent: 0, //spacing at the end of divider
                          ),
            
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildListView(_currentListView),
                    ],
                  ),
                ),
              ),
            
          ],
        ),

        

      );
    
  }

  Widget content(Widget ads){
   return Container(
    height: 100,
    width: 500,
    child:ads
   );

  }
}


