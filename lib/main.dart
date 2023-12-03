
import 'package:damaanati_ft/view/drafts/dialog.dart';
import 'package:damaanati_ft/view/drafts/dropdown.dart';
import 'package:damaanati_ft/view/drafts/invoice.dart';
import 'package:damaanati_ft/view/drafts/number.provider.dart';
import 'package:damaanati_ft/view/drafts/numberdisplay.dart';
import 'package:damaanati_ft/view/drafts/timeline.dart';
import 'package:damaanati_ft/view/home/addWarranty_screen.dart';
import 'package:damaanati_ft/view/category/category.dart';
import 'package:damaanati_ft/view/category/categoryItem.dart';
import 'package:damaanati_ft/view/home/feedBack_screen.dart';
import 'package:damaanati_ft/view/home/home_screen.dart';
import 'package:damaanati_ft/view/home/reminders_screen.dart';
//import 'package:damanati_app/view/page.dart';
import 'package:damaanati_ft/view/pagenav.dart';
import 'package:damaanati_ft/view/settings/about_damanti.dart';
import 'package:damaanati_ft/view/settings/help_support.dart';
import 'package:damaanati_ft/view/settings/language.dart';
import 'package:damaanati_ft/view/settings/privacy_policy.dart';
import 'package:damaanati_ft/view/settings/reminders_setup_screen.dart';
import 'package:damaanati_ft/view/onboarding/otp_screen.dart';
import 'package:damaanati_ft/view/onboarding/register_screen.dart';
import 'package:damaanati_ft/view/home/search_screen.dart';
import 'package:damaanati_ft/view/home/settings_screen.dart';
import 'package:damaanati_ft/view/onboarding/splash.view.dart';
import 'package:damaanati_ft/view/onboarding/user_information_screen.dart';
import 'package:damaanati_ft/view/home/warranty_details_screen.dart';
import 'package:damaanati_ft/view/settings/terms&conditions.dart';
import 'package:damaanati_ft/view/settings/user_profile_info.dart';
import 'package:damaanati_ft/view/side_drawer/naviigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:damaanati_ft/view/drafts/bottom.nav.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'date.dart';
import 'view/onboarding/setAvatar_screen.dart';



Future main() async {
  
  
//   WidgetsFlutterBinding.ensureInitialized();
//  await MobileAds.instance.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBU7vYgdcs1qRm0hzAkPYlsjGo4z2zT7Gk',
      appId: '1:253705611575:android:0107ec6db1846ae7ed52b2',
      messagingSenderId: '253705611575',
      projectId: 'damaanati',
    ),
  );
  await SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown,
  ]);

 
  runApp(
    ChangeNotifierProvider(
      create: (context) => InputProvider(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  
  

  @override
  Widget build(BuildContext context) {


    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,



       theme:  ThemeData(
          
          primaryColor: HexColor('#9B40CD') ,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
             
              elevation: 0, backgroundColor: HexColor('#4453CE'),
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            //filled: true,
            //fillColor: kPrimaryLightColor,
            //iconColor: kPrimaryColor,
            //prefixIconColor: kPrimaryColor,
            //contentPadding: EdgeInsets.symmetric(
              //  horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
          )),


       //home: const SplashView(),
      // home:  UserInfromationScreen(),
       //home:UserInfromationScreen(),
       //home: AddWarranty(),
     // home: HomeNavBar(),
     home: SetAvatar(),
      //home:  UserInfromationScreen(),
   // home: OtpScreen(),
     //home:  HomeScreen(),

     
     // home: Settings(),
      
       // home:Reminders(),
      // home: IUserInfromationScreen(),
      //home: HomeNavBar(),
        
      //home:MyHomePage(tasks: tasks,),//Profile(),


      routes: {
        'homenav': (context) => const HomeNavBar(),
        'home_screen': (context) => const HomeScreen(),
        'otp_screen': (context) => const OtpScreen(enteredValue: '',),
        'register_screen': (context) => const RegisterScreen(),
        'user_information_screen': (context) => const UserInfromationScreen (),
        'addWarranty_screen': (context) =>  AddWarranty(),
        'search_screen': (context) => const Search(),
        'settings_screen': (context) => const Settings(),
        'feedBack_screen': (context) => const FeedBack(),
        'reminders_screen': (context) =>  Reminders(),
        'categoryList': (context) =>  CategoryListScreen(),
        'category': (context) =>  CategoriesScreen(),
        'about_damanati': (context) => AboutDamanati(),
        'Help_support': (context) => HelpSupport(),
        'language': (context) => Language(),
        'privacy_policy': (context) => PrivacyPolicy(),
        'reminders_setup': (context) => RemindersSetUp(),
        'terms_conditions': (context) => TermsAndConditions(),
        'user_profile_info': (context) => UserProfileInfo(),
        'date': (context) => Date(),
        'IU': (context) => SetAvatar(),


        //drafts
         'Idraf': (context) => IDraft(),
         'idraf2': (context) => IInvoivce(),
         'idraf4': (context) => ShowDialog(),
         'idraf5': (context) => DropdownCategory(),
        

         

         


         

        
        

        
        
        // 'navigation_drawer':(context)=> NaviigationDrawer(),
       

        
       


        
        //'user_avatare_screen': (context) => UserAvatar(image: null, selectImage: () { },),
        //'user_avatare_screen': (context) => UserAvatar(image: null, selectImage: () { },),



        
      },
    );
  }
}