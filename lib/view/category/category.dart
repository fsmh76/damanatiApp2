import 'package:flutter/material.dart';
import 'dart:math';



class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    // Initialize some dummy categories
    categories = [
      Category(name: 'Electronics'),
      Category(name: 'Home Appliances'),
      Category(name: 'Books'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemListScreen(category: categories[index]),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: getRandomColor(),
            ),
            title: Text(categories[index].name),
            subtitle: Text('Items: ${categories[index].items.length}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
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
        child: Icon(Icons.add),
      ),
    );
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}

class Category {
  final String name;
  List<Item> items = [];

  Category({required this.name});
  
}

class ItemListScreen extends StatefulWidget {
  final Category category;

  ItemListScreen({required this.category});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        itemCount: widget.category.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Item Details'),
                    content: Text(widget.category.items[index].details),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            title: Text(widget.category.items[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemScreen(category: widget.category),
            ),
          ).then((newItem) {
            if (newItem != null) {
              setState(() {
                widget.category.items.add(newItem);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Item {
  final String name;
  final String details;

  Item({required this.name, required this.details});
}

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Category Name',
              ),
              controller: categoryNameController,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String categoryName = categoryNameController.text.trim();
                if (categoryName.isNotEmpty) {
                  Category newCategory = Category(name: categoryName);
                  Navigator.pop(context, newCategory);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddItemScreen extends StatefulWidget {
  final Category category;

  AddItemScreen({required this.category});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Item Name',
              ),
              controller: itemNameController,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Item Details',
              ),
              controller: itemDetailsController,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String itemName = itemNameController.text.trim();
                String itemDetails = itemDetailsController.text.trim();
                if (itemName.isNotEmpty && itemDetails.isNotEmpty) {
                  Item newItem = Item(
                    name: itemName,
                    details: itemDetails,
                  );
                  Navigator.pop(context, newItem);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}