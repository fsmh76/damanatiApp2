import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  

  @override
  Widget build(BuildContext context) {
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
                    const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'item'),
                    ),
                    SizedBox(
                      width: 320.0,

                      
                      child:  ElevatedButton(
                        
                        onPressed: () {},
                        child: const Text(
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
        
      
  }
}

















