import 'package:flutter/material.dart';



class IDraft extends StatelessWidget {
  
  final List<Map<String, dynamic>> _data = [
    {"item": "phone", "category": "appliances", "purchase_date": "21/2/2012", "start_date": "21/2/2012", 'warrantyEndDate': "2026-03-10", 'warrantyContact': '1-800-989-1214', 'notes': 'This is a TV.', 'shopPicture': 'assets/images/1.jpg', 'invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "ac", "category": "electronics", "purchase_date": "3/2/2020", "start_date": "3/2/2020", 'warrantyEndDate': "2026-03-09", 'warrantyContact': '1-800-2938-1213', 'notes': 'This is a phone.', 'shopPicture': 'assets/images/3.jpg', 'invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "necklace", "category": "accessories", "purchase_date": "6/8/2019", "start_date": "6/8/2019", 'warrantyEndDate': "2026-03-10", "warrantyContact": '1-800-3958-1214', "notes": 'This is a gadget.', "shopPicture": 'assets/images/2.jpg', "invoicePicture": 'assets/images/invoice.jpg'},
    {"item": "remote", "category": "gadgets", "purchase_date": "8/5/2023", "start_date": "8/5/2023", 'warrantyEndDate': "2026-03-16", 'warrantyContact': '1-4857-555-1214', 'notes': 'This is anything.', 'shopPicture': 'assets/images/1.jpg', 'invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "ball", "category": "sports", "purchase_date": "20/1/2018", "start_date": "21/1/2018", 'warrantyEndDate': "2026-06-17", 'warrantyContact': '1-2746-555-1214', 'notes': 'This is an invoice.', 'shopPicture': 'assets/images/3.jpg', 'invoicePicture': 'assets/images/invoice.jpg',},
    {"item": "car", "category": "automotive", "purchase_date": "2/12/2017", "start_date": "9/12/2017", 'warrantyEndDate': "2026-09-18", 'warrantyContact': '1-3674-555-1214', 'notes': 'This is whatever.', 'shopPicture': 'assets/images/2.jpg', 'invoicePicture': 'assets/images/invoice.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Warranty Details'),
        ),
        body: ListView.builder(
          itemCount:_data.length,
          itemBuilder: (context, index) {
            // Extract data for each item
            final itemData = _data[index];
            final purchaseDate = DateTime.parse(itemData["purchase_date"]);
            final warrantyEndDate = DateTime.parse(itemData["warrantyEndDate"]);

            // Calculate remaining days
            final currentDate = DateTime.now();
            final remainingDays = warrantyEndDate.difference(currentDate).inDays;

            // Format remaining text
            String remainingText = '';
            if (remainingDays > 365) {
              final remainingMonths = (remainingDays / 30).floor();
              remainingText = '$remainingMonths months left';
            } else {
              remainingText = '$remainingDays days left';
            }

            return ListTile(
              title: Text(remainingText),
              subtitle: LinearProgressIndicator(
                value: 1 - (remainingDays / warrantyEndDate.difference(purchaseDate).inDays),
              ),
            );
          },
        ),
      ),
    );
  }
}
