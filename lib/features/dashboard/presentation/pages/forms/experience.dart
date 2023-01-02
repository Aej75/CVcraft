import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.gr.dart';
import '../../../../../core/widgets/top_button.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

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
                'Experience',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          TextFormField(
            // keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Organization Name'),
          ),
          TextFormField(
            // keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Your title/position'),
          ),
          TextFormField(
            maxLines: 5,
            // keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Achivement'),
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
    ));
  }
}
