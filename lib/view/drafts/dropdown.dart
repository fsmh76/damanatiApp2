import 'package:flutter/material.dart';



class DropdownCategory extends StatefulWidget {
  @override
  _DropdownCategoryState createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  List<String> dropdownValues = ['Value1', 'Value2', 'Value3'];
  late String selectedValue;
  TextEditingController textFieldController = TextEditingController();

  void saveNewValue() {
    String newValue = textFieldController.text.trim();

    if (newValue.isNotEmpty) {
      if (!dropdownValues.contains(newValue)) {
        // Add the new value to the dropdown list
        setState(() {
          dropdownValues.add(newValue);
          selectedValue = newValue;
        });

        // Optionally, clear the text field after saving
        textFieldController.clear();
      } else {
        // Inform the user that the value already exists
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('The value already exists.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown and TextField Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedValue,
              items: dropdownValues.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter a new value',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNewValue,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
