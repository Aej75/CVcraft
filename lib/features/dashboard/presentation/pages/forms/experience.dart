import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    prefs.remove('experienceList');
    if (items == null) {
      setState(() {
        count.add(number.toString());
      });
    } else {
      setState(() {
        count.add(number.toString());
        print(count);
      });
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
                  Navigator.pop(context); // Pop the current route
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
              CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
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
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  // keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Organization Name'),
                                ),
                                TextFormField(
                                  // keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Your title/position'),
                                ),
                                TextFormField(
                                  maxLines: 5,

                                  // keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Achivement'),
                                ),
                              ],
                            ),
                          ))
                      .toList()),
              const SizedBox(height: 10),
              RoundButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  List<String>? items = prefs.getStringList('experienceList');

                  int totalItems = items == null ? 2 : items.length + 1;

                  number = totalItems;
                  setState(() {
                    count.add(number.toString());
                    print(count);
                  });
                  await prefs.setStringList('experienceList', count);
                },
              ),
              const SizedBox(height: 70),
              Align(
                alignment: AlignmentDirectional.center,
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
              )
            ],
          ),
        ],
      ),
    ));
  }
}
