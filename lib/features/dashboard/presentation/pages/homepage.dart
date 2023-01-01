import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_app/core/constants/colors.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:cv_app/core/widgets/tile.dart';
import 'package:cv_app/core/widgets/title.dart';
import 'package:cv_app/features/dashboard/presentation/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:styled_widget/styled_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
      openRatio: 1 / 2,
      openScale: 0.9,
      drawer: SafeArea(
        child: SizedBox(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/onboarding/onboarding_1.png',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.home,
                  ),
                  title: const Text(
                    'Home',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: BluePrint(
        noPadding: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: TextButton(
                      onPressed: () {
                        _advancedDrawerController.showDrawer();
                      },
                      style: TextButton.styleFrom(
                        elevation: 2,
                        foregroundColor: kDarkBlueColor,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(40, 40),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.menu),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'CV',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 50,
                            color: Colors.white),
                      ),
                      const Text(
                        'craft',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white),
                      ).padding(bottom: 6)
                    ],
                  ).padding(right: 40, top: 30, left: 10))
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              const CvTitle(title: 'Top Categories'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CvTile(title: 'Professional'),
                  CvTile(title: 'Simple', onPressed: () {}),
                  const CvTile(title: 'Creative'),
                  const CvTile(title: 'Academic'),
                ],
              ).padding(horizontal: 10),
              const SizedBox(
                height: 30,
              ),
              const CvTitle(title: 'Hot Picks'),
              const SliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
