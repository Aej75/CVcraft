import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_app/core/widgets/app_text_field.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/routes/routes.gr.dart';
import '../../../../../core/widgets/roundBotton.dart';
import '../../../../../core/widgets/top_button.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
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

    final List<String>? items = prefs.getStringList('experienceList');
    // prefs.remove('experienceList');
    if (items == null) {
      setState(() {
        count.add(number.toString());
      });
    } else {
      setState(() {
        count = items;
        print(count);
      });
    }
  }

  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return BaseView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onPressed: () {
                      context.router.push(const SkillsRoute());
                    },
                  ),
                  TopButton(
                    icon: Icons.arrow_forward_ios_rounded,
                    onPressed: () {
                      context.router.push(const EducationPageRoute());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Experience',
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Column(
                children: [
                  count.isNotEmpty
                      ? CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              // enlargeCenterPage: true,
                              scrollDirection: Axis.vertical,
                              viewportFraction: 0.9,
                              // aspectRatio: 16 / 9,
                              enableInfiniteScroll: false,
                              height: MediaQuery.of(context).size.height / 2.2,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          items: count
                              .map((e) => Card(
                                    color: const Color.fromARGB(
                                        255, 141, 170, 148),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              child: RoundButton(
                                                onPressed: () async {
                                                  final prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  List<String>? items =
                                                      prefs.getStringList(
                                                          'experienceList');

                                                  setState(() {
                                                    count.remove(e);
                                                    items!.remove(e);

                                                    int totalItems =
                                                        items.length;
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
                                                        'experienceList',
                                                        count);
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
                                            hintText: 'Organization Name',
                                          ),
                                          const AppTextField(
                                            hintText: 'Your title/position',
                                          ),
                                          const AppTextField(
                                            maxLine: 5,
                                            hintText: 'Achivement',
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList())
                      : const SizedBox(),
                  const SizedBox(height: 10),
                  RoundButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      List<String>? items =
                          prefs.getStringList('experienceList');

                      int totalItems = items == null ? 2 : items.length + 1;

                      number = totalItems;
                      setState(() {
                        count.add(number.toString());
                        print(count);
                      });
                      await prefs.setStringList('experienceList', count);
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
