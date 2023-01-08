import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/roundBotton.dart';
import '../../../../../core/widgets/top_button.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  int number = 1;
  List<String> count = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCount();
  }

  Future getCount() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? items = prefs.getStringList('educationList');
    // prefs.remove('count');
    if (items == null) {
      print('empty');
      setState(() {
        count.add(number.toString());
      });
    } else {
      setState(() {
        count = items;
      });
      print(count);
    }
  }

  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return BaseView(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: () {
                  context.router.push(
                      const ExperiencePageRoute()); // Pop the current route
                },
              ),
              TopButton(
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {
                  // context.router.push(const SkillsRoute());
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Education',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Column(
            children: [
              CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      // enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: false,
                      height: MediaQuery.of(context).size.height / 2.5,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: count
                      .map((e) => Card(
                            color: const Color.fromARGB(255, 141, 170, 148),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            elevation: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: RoundButton(
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          List<String>? items = prefs
                                              .getStringList('educationList');

                                          setState(() {
                                            count.remove(e);
                                            items!.remove(e);

                                            int totalItems = items.length;
                                            print(
                                                'total after removing = $totalItems');
                                            items.clear();

                                            for (int i = 1;
                                                i <= totalItems;
                                                i++) {
                                              setState(() {
                                                items.add(i.toString());
                                              });
                                            }
                                            count = items;
                                            print(count);
                                            prefs.setStringList(
                                                'educationList', count);
                                          });
                                        },
                                        iconData: const Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const AppTextField(
                                    hintText: 'Education institute name',
                                  ),
                                  const AppTextField(
                                    hintText: 'Module/ Course',
                                  ),
                                  const AppTextField(
                                    hintText: 'Location',
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList()),
              const SizedBox(height: 10),
              RoundButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  List<String>? items = prefs.getStringList('educationList');

                  int totalItems = items == null ? 2 : items.length + 1;

                  number = totalItems;
                  setState(() {
                    count.add(number.toString());
                    print(count);
                  });
                  await prefs.setStringList('educationList', count);
                },
              ),
              // const SizedBox(height: 70),
              // Align(
              //   alignment: AlignmentDirectional.center,
              //   child: SizedBox(
              //     height: 80,
              //     width: MediaQuery.of(context).size.width / 3,
              //     child: TextButton.icon(
              //       onPressed: () {},
              //       icon: const Icon(Icons.navigate_next_rounded),
              //       label: const Text(
              //         'Next',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       style: TextButton.styleFrom(
              //           foregroundColor: Colors.black,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20),
              //               side: const BorderSide(color: Colors.black26)),
              //           elevation: 2,
              //           backgroundColor: Colors.white),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    ));
  }
}
