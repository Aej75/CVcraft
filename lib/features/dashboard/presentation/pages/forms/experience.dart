import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_app/core/widgets/app_text_field.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  final List<TextEditingController> controllerListOrganization = [];
  final List<TextEditingController> controllerListPosition = [];
  final List<TextEditingController> controllerListAchivement = [];

  final List<String> controllerDataOrganization = [];
  final List<String> controllerDataPosition = [];
  final List<String> controllerDataAchivement = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCount();
    readFromDb();
  }

  final _myBox = Hive.box('myBox');

  readFromDb() async {
    var response = await _myBox.get('experience');
    print('data on experience database =$response');
    if (response != null) {
      for (int i = 0; i < controllerListOrganization.length; i++) {
        controllerListOrganization[i].text = response['organization'][i];
        controllerListPosition[i].text = response['position'][i];
        controllerListAchivement[i].text = response['achivement'][i];
      }
    }
  }

  writeInDb() async {
    controllerDataOrganization.clear();
    for (int i = 0; i < controllerListOrganization.length; i++) {
      controllerDataOrganization.add(controllerListOrganization[i].text);
      controllerDataPosition.add(controllerListPosition[i].text);
      controllerDataAchivement.add(controllerListAchivement[i].text);

      await _myBox.put('experience', {
        'organization': controllerDataOrganization,
        'position': controllerDataPosition,
        'achivement': controllerDataAchivement
      });
    }

    print(_myBox.get('experience'));
  }

  Future getCount() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? items = prefs.getStringList('experienceList');
    // items?.clear();
    // prefs.remove('count');
    if (items == null) {
      print('empty');
      setState(() {
        count.add(number.toString());
        // controllerList.add(controller);
      });
    } else {
      setState(() {
        count = items;
        for (int i = 0; i < items.length; i++) {
          controllerListOrganization.add(TextEditingController());
          controllerListPosition.add(TextEditingController());
          controllerListAchivement.add(TextEditingController());
        }
      });
      print(count);
    }
  }

// TODO: REMOVE the carousal slider,,

  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

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
                    onPressed: () async {
                      await writeInDb();
                      context.router.push(const SkillsRoute());
                    },
                  ),
                  TopButton(
                    icon: Icons.arrow_forward_ios_rounded,
                    onPressed: () async {
                      await writeInDb();

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
                  CarouselSlider(
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
                      items: [
                        for (int i = 0; i < count.length; i++)
                          Card(
                            color: const Color.fromARGB(255, 141, 170, 148),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            elevation: 10,
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
                                              .getStringList('experienceList');

                                          setState(() {
                                            count.remove(i.toString());
                                            items!.remove(i.toString());
                                            // ignore: list_remove_unrelated_type
                                            controllerDataOrganization.clear();
                                            controllerListOrganization.remove(
                                                controllerListOrganization[i]);

                                            controllerDataPosition.clear();
                                            controllerListPosition.remove(
                                                controllerListPosition[i]);

                                            controllerDataAchivement.clear();
                                            controllerListAchivement.remove(
                                                controllerListAchivement[i]);

                                            int totalControllerOrganization =
                                                controllerListOrganization
                                                    .length;

                                            for (int i = 0;
                                                i < totalControllerOrganization;
                                                i++) {
                                              controllerDataOrganization.add(
                                                  controllerListOrganization[i]
                                                      .text);
                                              controllerDataPosition.add(
                                                  controllerListPosition[i]
                                                      .text);
                                              controllerDataAchivement.add(
                                                  controllerListAchivement[i]
                                                      .text);
                                            }

                                            print(controllerDataOrganization);

                                            int totalItems = items.length;

                                            print(
                                                'Total Controller after removin=$totalControllerOrganization');
                                            // print(
                                            //     'total after removing = $totalItems');
                                            items.clear();
                                            // controllerList.clear();

                                            for (int i = 0;
                                                i < totalItems;
                                                i++) {
                                              setState(() {
                                                // controllerList.add(
                                                //     TextEditingController());

                                                items.add(i.toString());
                                              });
                                            }
                                            // for (int i = 1;
                                            //     i <= totalItems;
                                            //     i++) {
                                            //   setState(() {
                                            //     controllerList.add(
                                            //         TextEditingController());
                                            //     items.add(i.toString());
                                            //   });
                                            // }
                                            // print(_controller);
                                            count = items;
                                            print(count);
                                            prefs.setStringList(
                                                'experienceList', count);
                                          });
                                        },
                                        iconData: const Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppTextField(
                                    controller: controllerListOrganization[i],
                                    hintText: 'Organization Name',
                                  ),
                                  AppTextField(
                                    controller: controllerListPosition[i],
                                    hintText: 'Your title/position',
                                  ),
                                  AppTextField(
                                    controller: controllerListAchivement[i],
                                    maxLine: 5,
                                    hintText: 'Achivement',
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ]),
                  const SizedBox(height: 10),
                  RoundButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      List<String>? items =
                          prefs.getStringList('experienceList');

                      setState(() {
                        controllerListOrganization.add(controller);
                        controllerListPosition.add(controller);
                        controllerListAchivement.add(controller);

                        count.add(items!.length.toString());
                        // print(controllerList);
                        print(count);
                      });

                      controllerDataOrganization.clear();
                      controllerDataPosition.clear();
                      controllerDataAchivement.clear();
                      for (int i = 0;
                          i < controllerListOrganization.length;
                          i++) {
                        controllerDataOrganization
                            .add(controllerListOrganization[i].text);
                        controllerDataAchivement
                            .add(controllerListAchivement[i].text);
                        controllerDataPosition
                            .add(controllerListPosition[i].text);
                      }
                      print(controllerDataOrganization);
                      print(controllerDataPosition);
                      print(controllerDataAchivement);

                      await prefs.setStringList('experienceList', count);
                    },
                  )
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
