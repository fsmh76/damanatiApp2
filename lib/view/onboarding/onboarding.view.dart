import 'package:damaanati_ft/view/onboarding/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:damaanati_ft/models/content_model.dart';
import 'package:snippet_coder_utils/hex_color.dart';




class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<OnboardingView> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        actions: [
         TextButton( onPressed: () {
          Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreen(),
                    ),
                  );
           }, child: Text('skip',),),
       ],
       ),
      body:
      
       Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60, left: 60,top: 10, bottom:30),
            
              child: Center(
                child: const Image(image: AssetImage('assets/images/logo_damanati.png')) ,
              ),
            
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    contents.length,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            
                child: TextButton(
                  
                  
                  style: TextButton.styleFrom(
                    
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  
                    
                      backgroundColor:HexColor('#4453CE'),
                      ),
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    }
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                    
                  },
                  
                  child: Text(
                      currentIndex == contents.length - 1 ? "Continue" : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                  //color: Theme.of(context).primaryColor,
                  //textColor: Colors.white,
                  //shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(20),
                  //),
                  
                ),
              
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      
      height: 20,
      width: currentIndex == index ? 30 : 20,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: HexColor('#9B40CD'),
        borderRadius: BorderRadius.circular(20),
         
        
        //color: kPrimaryColor,
      ),
    );
  }
}