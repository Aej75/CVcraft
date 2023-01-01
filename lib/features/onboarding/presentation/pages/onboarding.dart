import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/features/onboarding/presentation/bloc/first_time_status_bloc.dart';
import 'package:cv_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _isFirstTime = false;
  final FirstTimeStatusBloc firstTimeStatusBloc;

  _OnboardingPageState() : firstTimeStatusBloc = getIt<FirstTimeStatusBloc>();

  void _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');
    if (firstTime == null) {
      // App has not been opened before
      setState(() {
        _isFirstTime = true;
      });
      prefs.setBool('first_time', false);
      print(_isFirstTime);
    } else {
      // App has been opened before
      setState(() {
        _isFirstTime = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => firstTimeStatusBloc..add(FirstTimeCheck()),
      child: BlocListener<FirstTimeStatusBloc, FirstTimeStatusState>(
        listener: (context, state) {
          if (state is FirstTimeStatusFalse) {
            context.router.pushAndPopUntil(const HomePageRoute(),
                predicate: (route) => false);
            debugPrint('Not First Time');
          } else if (state is FirstTimeStatusTrue) {
            debugPrint('First time');
          }
        },
        child: OnBoardingSlider(
            finishButtonText: 'Finish',
            finishButtonColor: Colors.teal,
            controllerColor: kDarkBlueColor,
            onFinish: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('first_time', false);
            },
            background: [
              SizedBox(
                // color: Colors.amber,
                width: size.width,
                height: size.height / 2,
                child: Center(
                  child: SvgPicture.asset(
                      'assets/images/onboarding/onboarding_first.svg'),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height / 2,
                // color: Colors.red,
                child: Center(
                  child: SvgPicture.asset(
                      'assets/images/onboarding/onboarding_first.svg'),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height / 2,
                // color: kDarkBlueColor,
                child: Center(
                  child: SvgPicture.asset(
                      'assets/images/onboarding/onboarding_first.svg'),
                ),
              ),
            ],
            totalPage: 3,
            headerBackgroundColor: Colors.white,
            pageBackgroundColor: Colors.white,
            trailing: const Text(
              'Login',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            speed: 1.0,
            pageBodies: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 480,
                    ),
                    Text(
                      'On your way...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'to find the perfect looking Onboarding for your app?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 480,
                    ),
                    Text(
                      'You’ve reached your destination.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sliding with animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 480,
                    ),
                    Text(
                      'Start now!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Where everything is possible and customize your onboarding.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
