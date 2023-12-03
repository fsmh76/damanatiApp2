import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:damaanati_ft/view/onboarding/onboarding.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:snippet_coder_utils/hex_color.dart';
//import '../constants.dart';
//import '../utils/global.colors.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _BottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
      TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
         weight:1,
         ),

          TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
         weight:1,
         ),

          TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
         weight:1,
         ),

          TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
         weight:1,
         ),

         
         

      
      
    ]
    ).animate(_controller);
    Timer(const Duration(seconds: 5), () {
      Get.to(const OnboardingView());
    });



        _BottomAlignmentAnimation = TweenSequence<Alignment>(
      [
      TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
         weight:1,
         ),

          TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
         weight:1,
         ),

          TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
         weight:1,
         ),

          TweenSequenceItem(
        tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
         weight:1,
         ),

         
         

      
      
    ]
    ).animate(_controller);
    Timer(const Duration(seconds: 5), () {
      Get.to(const OnboardingView());
    });



     _controller.repeat();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation:_controller,
        builder: (BuildContext context, Widget? child) { 


         return AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options:  ParticleOptions(
              spawnMaxRadius: 200,
              spawnMinSpeed: 2.00,
              particleCount: 7,
              spawnMaxSpeed: 60,
              minOpacity: 0.2,
              spawnOpacity: 0.3,
              baseColor: HexColor('#9B40CD'),
             // image: Image(image: AssetImage('assets/images/logo_damanati2.png'))
            )
          ),
          vsync: this, 
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 300,
                height: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25),
                    ),
                 child: Image.asset(
                   'assets/images/logo_damanati.png',
                ),
              ),
            ),
          ),
        );



         },
        
      ),
    );
  }
}