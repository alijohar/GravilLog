import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/app_theme.dart';
import '../../../../core/resources/constants_manager.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final SplashController splashController = Get.find();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), () => splashController.checkUserStatus());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
      body:  SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height, // Set height to full screen
          child: Stack(
            children: [
              Positioned(
                  left: -180,
                  top: -113,
                  child: Container(
                    width: 400,
                    height: 402,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.pinkSherbet.withOpacity(0.10),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child:
                        Image.asset('assets/images/GraviLog-Ar-tran1.png')),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/GraviLog-En-tran1.png'))
                  ],
                ),
              ),
              Positioned(
                  left: 180,
                  bottom: -113,
                  child: Container(
                    width: 400,
                    height: 402,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.skyBlue.withOpacity(0.20),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}