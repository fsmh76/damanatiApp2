import 'dart:math';

import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Categories App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CategoriesScreen(),
//     );
//   }
// }

// class CategoriesScreen extends StatefulWidget {
//   @override
//   _CategoriesScreenState createState() => _CategoriesScreenState();
// }

// class _CategoriesScreenState extends State<CategoriesScreen> {
//   List<Category> categories = [
//     Category(name: 'Car', items: []),
//     Category(name: 'Electronics', items: []),
//     Category(name: 'Fashion', items: []),
//     Category(name: 'Home', items: []),
//     Category(name: 'Sports', items: []),
//     Category(name: 'Toys', items: []),
//   ];

//   void addCategory(String categoryName) {
//     setState(() {
//       categories.add(Category(
//         name: categoryName,
//         items: [],
//       ));

//       categories.sort((a, b) => a.name.compareTo(b.name));
//     });
//   }

//   void removeCategory(Category category) {
//     setState(() {
//       categories.remove(category);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//       ),
//       body: ReorderableListView(
//         onReorder: (int oldIndex, int newIndex) {
//           setState(() {
//             if (newIndex > oldIndex) newIndex -= 1;
//             final Category category = categories.removeAt(oldIndex);
//             categories.insert(newIndex, category);
//           });
//         },
//         children: categories.map((category) {
//           return CategoryTile(
//             key: ValueKey(category),
//             category: category,
//             onCategoryDeleted: removeCategory,
//           );
//         }).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => AddCategoryDialog(
//               onCategoryAdded: addCategory,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Category {
//   final String name;
//   final List<Item> items;

//   Category({
//     required this.name,
//     required this.items,
//   });
// }

// class Item {
//   final String name;
//   final String details;

//   Item({
//     required this.name,
//     required this.details,
//   });
// }

// class CategoryTile extends StatefulWidget {
//   final Category category;
//   final Function(Category) onCategoryDeleted;

//   CategoryTile({
//     required Key key,
//     required this.category,
//     required this.onCategoryDeleted,
//   }) : super(key: key);

//   @override
//   _CategoryTileState createState() => _CategoryTileState();
// }

// class _CategoryTileState extends State<CategoryTile> {
//   int itemCount = 0;

//   void addItem() {
//     setState(() {
//       itemCount++;
//     });
//   }

//   void openItemsScreen() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ItemsScreen(
//           category: widget.category,
//           onItemCountUpdated: (count) {
//             setState(() {
//               itemCount = count;
//             });
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: openItemsScreen,
//       onLongPress: () => widget.onCategoryDeleted(widget.category),
//       leading: CircleAvatar(
//         backgroundColor: getRandomColor(),
//       ),
//       title: Text(widget.category.name),
//       subtitle: Text('Items: $itemCount'),
//     );
//   }
// }

// class ItemsScreen extends StatefulWidget {
//   final Category category;
//   final Function(int) onItemCountUpdated;

//   ItemsScreen({
//     required this.category,
//     required this.onItemCountUpdated,
//   });

//   @override
//   _ItemsScreenState createState() => _ItemsScreenState();
// }

// class _ItemsScreenState extends State<ItemsScreen> {
//   List<Item> items = [];

//   void addItem() {
//     showDialog(
//       context: context,
//       builder: (context) => AddItemDialog(
//         onItemAdded: (String itemName, String itemDetails) {
//           setState(() {
//             items.add(Item(
//               name: itemName,
//               details: itemDetails,
//             ));
//           });
//           widget.onItemCountUpdated(items.length);
//         },
//       ),
//     );
//   }

//   void openItemDetails(Item item) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(item.name),
//           content: Text(item.details),
//           actions: [
//             TextButton(
//               child: Text('Close'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.category.name),
//       ),
//       body: ListView.builder(
        
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return ListTile(
//             onTap: () => openItemDetails(item),
//             title: Text(item.name),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: addItem,
//       ),
//     );
//   }
// }

// class AddCategoryDialog extends StatefulWidget {
//   final Function(String) onCategoryAdded;

//   AddCategoryDialog({required this.onCategoryAdded});

//   @override
//   _AddCategoryDialogState createState() => _AddCategoryDialogState();
// }

// class _AddCategoryDialogState extends State<AddCategoryDialog> {
//   TextEditingController _categoryNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add Category'),
//       content: TextField(
//         controller: _categoryNameController,
//         decoration: InputDecoration(
//           labelText: 'Category Name',
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: Text('Cancel'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         ElevatedButton(
//           child: Text('Add'),
//           onPressed: () {
//             final categoryName = _categoryNameController.text;
//             widget.onCategoryAdded(categoryName);
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }

// class AddItemDialog extends StatefulWidget {
//   final Function(String, String) onItemAdded;

//   AddItemDialog({required this.onItemAdded});

//   @override
//   _AddItemDialogState createState() => _AddItemDialogState();
// }

// class _AddItemDialogState extends State<AddItemDialog> {
//   TextEditingController _itemNameController = TextEditingController();
//   TextEditingController _itemDetailsController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add Item'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: _itemNameController,
//             decoration: InputDecoration(
//               labelText: 'Item Name',
//             ),
//           ),
//           TextField(
//             controller: _itemDetailsController,
//             decoration: InputDecoration(
//               labelText: 'Item Details',
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           child: Text('Cancel'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         ElevatedButton(
//           child: Text('Add'),
//           onPressed: () {
//             final itemName = _itemNameController.text;
//             final itemDetails = _itemDetailsController.text;
//             widget.onItemAdded(itemName, itemDetails);
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }

// Color getRandomColor() {
//   final random = Random();
//   return Color.fromARGB(
//     255,
//     random.nextInt(256),
//     random.nextInt(256),
//     random.nextInt(256),
//   );
// }

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [
    Category(name: 'Car', items: [], date:'week'),
    Category(name: 'Electronics', items: [], date:'week'),
    Category(name: 'Fashion', items: [], date:'week'),
    Category(name: 'Home', items: [],date:'week'),
    Category(name: 'Sports', items: [],date:'week'),
    Category(name: 'Toys', items: [],date:'week'),
  ];

  void addCategory(String categoryName, String expiryDate) {
    setState(() {
      categories.add(Category(
        name: categoryName,
        items: [],
        date: expiryDate
      ));

      categories.sort((a, b) => a.name.compareTo(b.name));
    });
  }

  void removeCategory(Category category) {
    setState(() {
      categories.remove(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final Category category = categories.removeAt(oldIndex);
            categories.insert(newIndex, category);
          });
        },
        children: categories.map((category) {
          return CategoryTile(
            key: ValueKey(category),
            category: category,
            onCategoryDeleted: removeCategory,
          );
        }).toList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) => AddCategoryDialog(
      //         onCategoryAdded: addCategory,
      //       ),
      //     );
      //   },
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: TextButton(
            child: Text(
              'All Items',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllItemsScreen(categories: categories),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final List<Item> items;
  final String date;


  Category({
    required this.name,
    required this.items,
    required this.date
  });
}

class Item {
  final String name;
  final String details;

  Item({
    required this.name,
    required this.details,
  });
}

class CategoryTile extends StatefulWidget {
  final Category category;
  final Function(Category) onCategoryDeleted;

  CategoryTile({
    required Key key,
    required this.category,
    required this.onCategoryDeleted,
  }) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  int itemCount = 0;

  void addItem() {
    setState(() {
      itemCount++;
    });
  }

  void openItemsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemsScreen(
          category: widget.category,
          onItemCountUpdated: (count) {
            setState(() {
              itemCount = count;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: openItemsScreen,
      onLongPress: () => widget.onCategoryDeleted(widget.category),
      leading: CircleAvatar(
        backgroundColor: getRandomColor(),
      ),
      title: Text(widget.category.name),
      subtitle: Text('Items: $itemCount'),
    );
  }
}

class ItemsScreen extends StatefulWidget {
  final Category category;
  final Function(int) onItemCountUpdated;

  ItemsScreen({
    required this.category,
    required this.onItemCountUpdated,
  });

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<Item> items = [];

  void addItem() {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
        onItemAdded: (String itemName, String itemDetails) {
          setState(() {
            items.add(Item(
              name: itemName,
              details: itemDetails,
            ));
          });
          widget.onItemCountUpdated(items.length);
        },
      ),
    );
  }

  void openItemDetails(Item item) {
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text(item.name),
        content: Text(item.details),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => openItemDetails(items[index]),
            title: Text(items[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addItem,
      ),
    );
  }
}

class AllItemsScreen extends StatelessWidget {
  final List<Category> categories;

  AllItemsScreen({required this.categories});

  @override
  Widget build(BuildContext context) {
    List<Item> allItems = [];
    for (var category in categories) {
      allItems.addAll(category.items);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
      ),
      body: ListView.builder(
        itemCount: allItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(allItems[index].name),
          );
        },
      ),
    );
  }
}

class AddCategoryDialog extends StatefulWidget {
  final Function(String) onCategoryAdded;

  AddCategoryDialog({required this.onCategoryAdded});

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Category'),
      content: TextField(
        controller: _categoryNameController,
        decoration: InputDecoration(
          labelText: 'Category Name',
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Add'),
          onPressed: () {
            String categoryName = _categoryNameController.text.trim();
            if (categoryName.isNotEmpty) {
              widget.onCategoryAdded(categoryName);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}

class AddItemDialog extends StatefulWidget {
  final Function(String, String) onItemAdded;

  AddItemDialog({required this.onItemAdded});

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _itemNameController,
            decoration: InputDecoration(
              labelText: 'Item Name',
            ),
          ),
          TextField(
            controller: _itemDetailsController,
            decoration: InputDecoration(
              labelText: 'Item Details',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Add'),
          onPressed: () {
            String itemName = _itemNameController.text.trim();
            String itemDetails = _itemDetailsController.text.trim();
            if (itemName.isNotEmpty && itemDetails.isNotEmpty) {
              widget.onItemAdded(itemName, itemDetails);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}