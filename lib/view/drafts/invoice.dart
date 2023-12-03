import 'package:damaanati_ft/view/drafts/invoice.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoicePage extends StatelessWidget {
  final Item item;

  InvoicePage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.itemName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(item.itemPicture),
            Text("Start Date: ${DateFormat('dd/MM/yyyy').format(item.startDate)}"),
            Text("End Date: ${DateFormat('dd/MM/yyyy').format(item.endDate)}"),
            Text("Contact Number: ${item.contactNumber}"),
            Text("Description: ${item.description}"),
            ElevatedButton(
              onPressed: () {
                // Navigate to view invoice picture page
              },
              child: Text("View Invoice Picture"),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete the item
              },
              child: Text("Delete Item"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to view shop location page
              },
              child: Text("View Shop Location"),
            ),
          ],
        ),
      ),
    );
  }
}


class IInvoivce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Items List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].itemName),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoicePage(item: items[index]),
                  ),
                );
              },
            );
          },
        ),
      );
    
  }
}

