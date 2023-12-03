import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../models/reminder_model.dart';



class ItemsPage extends StatelessWidget {

  
  final List<Item> items;

  const ItemsPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsPage(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



class ItemDetailsPage extends StatelessWidget {
  final Item item;

  const ItemDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
        child: Text(item.description),
      ),
    );
  }
}



class RemindersSetupPage extends StatefulWidget {
  final List<Item> items;

  const RemindersSetupPage({Key? key, required this.items}) : super(key: key);

  @override
  _RemindersSetupPageState createState() => _RemindersSetupPageState();
}

class _RemindersSetupPageState extends State<RemindersSetupPage> {


 List<Item> items = [
    Item(title: 'Item 1', description: 'Description 1'),
    Item(title: 'Item 2', description: 'Description 2'),
    Item(title: 'Item 3', description: 'Description 3'),
  ];

  List<Reminder> reminders = [];

  Item? selecteditem;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders Setup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Item>(
              value: selecteditem,
              onChanged: (Item? newValue) {
                setState(() {
                  selecteditem = newValue;
                });
              },
              items: widget.items.map<DropdownMenuItem<Item>>((Item item) {
                return DropdownMenuItem<Item>(
                  value: item,
                  child: Text(item.title),
                );
              }).toList(),
            ),
            // Add other form fields as needed (e.g., reminder date)
            ElevatedButton(
              onPressed: () {
                // Save the reminder
                if (selecteditem != null && selectedDate != null) {
                  final reminder = Reminder(item: selecteditem!, reminderDate: selectedDate!);
                  setState(() {
                    reminders.add(reminder);
                  });
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}



class RemindersPage extends StatelessWidget {
  final List<Reminder> reminders;

  const RemindersPage({Key? key, required this.reminders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount:reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ListTile(
            title: Text(reminder.item.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsPage(item: reminder.item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}