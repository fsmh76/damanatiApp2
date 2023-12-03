import 'package:flutter/material.dart';

//import 'bottom_bar.dart';
import 'package:hexcolor/hexcolor.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
  @override
  initState() {
    // at the beginning, all data are shown
    _datalist = _data;
    super.initState();
  }

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
      body: Column(
        children: [
          Divider(
                              color: HexColor('#9B40CD'), //color of divider
                               height: 0, //height spacing of divider
                               thickness: 3, //thickness of divier line
                               indent: 0, //spacing at the start of divider
                               endIndent: 0, //spacing at the end of divider
                              ),

                              TextField(
                    onChanged: (value) => _runFilter(value),
                    cursorColor: const Color.fromARGB(255, 126, 125, 125),
                    decoration: const InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor:Color.fromARGB(255, 238, 238, 238),
                    labelText: 'filter', suffixIcon: Icon(Icons.filter_alt),
                    alignLabelWithHint: true,
                    hintTextDirection: TextDirection.ltr,
                    contentPadding: EdgeInsets.only(bottom: 9.0),
                    
                    ),),
        ],
      ),

    
    );
  }
}
