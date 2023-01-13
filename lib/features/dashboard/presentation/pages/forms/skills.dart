import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:cv_app/core/widgets/roundBotton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/widgets/top_button.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  int number = 1;
  List<String> count = [];

  TextEditingController controller = TextEditingController();

  final List<TextEditingController> controllerList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCount();
  }

  Future getCount() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? items = prefs.getStringList('count');
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
          controllerList.add(TextEditingController());
        }
      });
      print(count);
    }
  }

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
                      const ResumeObjectiveRoute()); // Pop the current route
                },
              ),
              TopButton(
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {
                  context.router.push(const ExperiencePageRoute());
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Skills',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        for (int i = 0; i < count.length; i++)
                          Column(
                            children: [
                              TextFormField(
                                controller: controllerList[i],
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xffF6F6F6),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: RoundButton(
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          List<String>? items =
                                              prefs.getStringList('count');

                                          setState(() {
                                            count.remove(i.toString());
                                            items!.remove(i.toString());

                                            if (controllerList.length > 1) {
                                              controllerList
                                                  .remove(controllerList[i]);
                                            }

                                            int totalController =
                                                controllerList.length;

                                            int totalItems = items.length;

                                            print(
                                                'Total Controller after removin=$totalController');
                                            // print(
                                            //     'total after removing = $totalItems');
                                            items.clear();
                                            controllerList.clear();

                                            for (int i = 1;
                                                i <= totalItems;
                                                i++) {
                                              setState(() {
                                                controllerList.add(
                                                    TextEditingController());
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
                                            prefs.setStringList('count', count);
                                          });
                                        },
                                        iconData: const Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Add your skill'),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    List<String>? items = prefs.getStringList('count');

                    int totalItems = items == null ? 2 : items.length + 1;

                    number = totalItems;
                    setState(() {
                      count.add(number.toString());
                      controllerList.add(TextEditingController());
                      // print(controllerList);
                      print(count);
                    });
                    await prefs.setStringList('count', count);
                  },
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: 100,
          //   child: Align(
          //     alignment: AlignmentDirectional.bottomCenter,
          //     child: SizedBox(
          //       height: 80,
          //       width: MediaQuery.of(context).size.width / 3,
          //       child: TextButton.icon(
          //         onPressed: () {},
          //         icon: const Icon(Icons.navigate_next_rounded),
          //         label: const Text(
          //           'Next',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         style: TextButton.styleFrom(
          //             foregroundColor: Colors.black,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20),
          //                 side: const BorderSide(color: Colors.black26)),
          //             elevation: 2,
          //             backgroundColor: Colors.white),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}
