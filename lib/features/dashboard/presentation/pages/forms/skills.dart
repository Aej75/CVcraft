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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCount();
  }

  Future getCount() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? items = prefs.getStringList('count');

   
    if (items!.isEmpty) {
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
                    children: count
                        .map(
                          (e) => Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          List<String>? items =
                                              prefs.getStringList('count');

                                          setState(() {
                                            items!.remove(e);

                                            int totalItems = items.length;
                                            print(
                                                'total after removint = $totalItems');
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
                                            prefs.setStringList('count', count);
                                          });
                                        },
                                        child: const Icon(Icons.delete)),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Add your skill'),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                        .toList()),
                const SizedBox(
                  height: 20,
                ),
                RoundButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    List<String>? items = prefs.getStringList('count');

                    int totalItems = items!.length + 1;

                    number = totalItems;
                    setState(() {
                      count.add(number.toString());
                      print(count);
                    });
                    await prefs.setStringList('count', count);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width / 3,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next_rounded),
                  label: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black26)),
                      elevation: 2,
                      backgroundColor: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
