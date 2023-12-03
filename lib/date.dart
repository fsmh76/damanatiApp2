import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/hex_color.dart';

//import 'bottom_bar.dart';


class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    

          return Scaffold(
               appBar: AppBar(
        leading: const BackButton(
         color: Colors.black,),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 247, 246, 247),
        title: Text(
          'Terms & Conditions',
          style:  GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#4453CE'),
                          
                        ),

        ),
         centerTitle: true, // like this!
        
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              runSpacing: 8,
              children: <Widget>[
                Text(
                  'DAMAANATI is your trusted bilingual (Arabic and English) companion, available on both Android and iOS platforms. Our mission is to streamline the way you manage your product warranties. With DAMAANATI, you can effortlessly capture warranty details at the point of purchase, including product category, purchase date, warranty start and end dates, shop location, invoice scans, warranty card images, and even snapshots of the shop.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 16),
                Text(
                  'Why Choose DAMAANATI?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 8),
                Text(
                  'Tired of sifting through stacks of paper receipts and warranty documents? Our app is here to save the day! Say goodbye to lost warranties, forgotten expiration dates, and the stress of finding that crucial piece of information when you need it most.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 16),
                Text(
                  'How It Works:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 8),
                Text(
                  'Add Warranties: Snap a photo or manually input warranty details. Include product name, purchase date, warranty period, and any additional notes.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 8),
                Text(
                  'Organize: Sort warranties into categories for quick and efficient retrieval.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 8),
                Text(
                  'Set Reminders: Receive notifications before warranties expire, ensuring you never miss an opportunity to make a claim.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 8),
                Text(
                  'Access Anywhere: Your warranties are securely stored in the cloud, accessible from your smartphone, tablet, or computer.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 16),
                Text(
                  'Download DAMAANATI today and take control of your warranties like never before. Simplify your life, declutter your paperwork, and stay prepared for whatever comes your way.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 16),
                Text(
                  'Have questions or feedback? Reach out to our dedicated support team at support@damaanatiapp.com.',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 16),
                Text(
                  'Your warranty management journey starts here!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: 8),
                Text(
                  'App Version: 0.0.1',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                Text(
                  'App Designer: Inas Siddiqui',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                Text(
                  'App Developer: Farha Hussaini',
                  style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
