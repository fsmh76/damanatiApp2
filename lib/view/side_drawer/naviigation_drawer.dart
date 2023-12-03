import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:damaanati_ft/view/onboarding/register_screen.dart';
import 'package:damaanati_ft/view/settings/about_damanti.dart';
import 'package:damaanati_ft/view/settings/help_support.dart';
import 'package:damaanati_ft/view/settings/language.dart';
import 'package:damaanati_ft/view/settings/privacy_policy.dart';
import 'package:damaanati_ft/view/settings/reminders_setup_screen.dart';
import 'package:damaanati_ft/view/settings/terms&conditions.dart';
import 'package:damaanati_ft/view/settings/user_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'drawer_item.dart';

class NaviigationDrawer extends StatelessWidget {
  final File? imageFile;
  final placeholderImageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaYAvsj5zJqb6jSNdlX8R6M2_LDR05IJSPabWMFc_SMCDemb2R5b5kveXi99LCif7saKc&usqp=CAU";
  
  const NaviigationDrawer(BuildContext context, {Key? key, required this.imageFile} ) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: HexColor('#4453CE'),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Edit Profile',
                icon: Icons.people,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Reminders Setup',
                  icon: Icons.account_box_rounded,
                  onPressed: ()=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Language',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 7)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'About DAMAANATI',
                  icon: Icons.message_outlined,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Privacy Policy',
                  icon: Icons.privacy_tip,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Terms & Conditions',
                  icon: Icons.assignment,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Help & Support',
                  icon: Icons.help,
                  onPressed: ()=> onItemPressed(context, index: 5)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Sign Out',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 6)
              ),
              
              
              

            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileInfo()));
        break;

        case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const RemindersSetUp()));
        break;

        case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutDamanati()));
        break;

        case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
        break;

        case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndConditions()));
        break;

        case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpSupport()));
        break;

        case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
        break;

        case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Language()));
        break;
    }
  }

  Widget headerWidget() {
    
    return Row(
      children: [
         ClipOval(
              child: SizedBox(
                width: 70, // Adjust the width and height according to your needs
                height: 70,
                child: imageFile != null
                    ? kIsWeb
                        ? Image.network(imageFile!.path, fit: BoxFit.cover)
                        : Image.file(imageFile!, fit: BoxFit.cover)
                    : Image.network(placeholderImageUrl, fit: BoxFit.cover),
              ),
            ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Person name', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('0533****67', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );

  }
}