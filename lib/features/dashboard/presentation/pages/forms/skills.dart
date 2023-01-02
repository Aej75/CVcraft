import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/top_button.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with AutomaticKeepAliveClientMixin {
  int number = 4;
  List<int> count = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                                    border: const OutlineInputBorder(),
                                    hintText: 'Skill no. $e'),
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
                Align(
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                    onPressed: () {
                      number++;
                      setState(() {
                        count.add(number);
                        print(count);
                      });
                    },
                    style: IconButton.styleFrom(
                      elevation: 2,
                      padding: const EdgeInsets.all(5),
                      minimumSize: Size.zero,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Icon(Icons.add),
                  ),
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

  @override
  bool get wantKeepAlive => true;
}
