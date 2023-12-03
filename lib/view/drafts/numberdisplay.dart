// import 'package:damaanati_ft/view/drafts/number.provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';



// class NumberTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Number'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Enter Code',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 Provider.of<InputProvider>(context, listen: false).setCode(value);
//               },
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DisplayPage()),
//                 );
//               },
//               child: Text('Go to Display Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DisplayPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String phoneNumber = Provider.of<InputProvider>(context).phoneNumber;
//     String countryCode = Provider.of<InputProvider>(context).countryCode;

//    // Display only the last four digits
//     String displayedNumber = phoneNumber.length > 4
//         ? '+$countryCode *****${phoneNumber.substring(phoneNumber.length - 4)}'
//         : '+$countryCode $phoneNumber';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Page'),
//       ),
//       body: Center(
//         child: Text(
//           displayedNumber,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }