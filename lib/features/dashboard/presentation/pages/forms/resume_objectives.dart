import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/widgets/app_text_field.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.gr.dart';
import '../../../../../core/widgets/top_button.dart';

class ResumeObjective extends StatefulWidget {
  const ResumeObjective({super.key});

  @override
  State<ResumeObjective> createState() => _ResumeObjectiveState();
}

class _ResumeObjectiveState extends State<ResumeObjective> {
  final TextEditingController _objectives = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var box = Hive.box('personal_details');
    // var details = box.get('details');
    // print(details);
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
                onPressed: () async {
                  await context.router.push(const EditTempletPageRoute());
                  context.router.pop();
                },
              ),
              TopButton(
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {
                  context.router.push(const SkillsRoute());
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Resume\nObjectives',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: AppTextField(
              controller: _objectives,
              hintText: 'Resume objective/ summary',
              maxLine: 6,
            ),
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
    ));
  }
}
