import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/core/widgets/app_text_field.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:cv_app/core/widgets/top_button.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf/widgets.dart' as pw;

class EditTempletPage extends StatefulWidget {
  const EditTempletPage({super.key});

  @override
  State<EditTempletPage> createState() => _EditTempletPageState();
}

class _EditTempletPageState extends State<EditTempletPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _designation = TextEditingController();

  final pdf = pw.Document();
  readPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  void initState() {
    super.initState();
    readFromDb();
  }

  final _myBox = Hive.box('myBox');

  readFromDb() async {
    var response = _myBox.get('personal_details');
    if (response != null) {
      _firstName.text = response?['first_name'];
      _lastName.text = response?['last_name'];
      _email.text = response?['email'];
      _city.text = response?['city'];
      _country.text = response?['country'];
      _designation.text = response?['designation'];
    }
  }

  writeInDb() async {
    await _myBox.put('personal_details', {
      'first_name': _firstName.text.isNotEmpty ? _firstName.text : '',
      'last_name': _lastName.text.isNotEmpty ? _lastName.text : '',
      'email': _email.text.isNotEmpty ? _email.text : '',
      'city': _city.text.isNotEmpty ? _city.text : '',
      'country': _country.text.isNotEmpty ? _country.text : '',
      'designation': _designation.text.isNotEmpty ? _designation.text : ''
    });

    print(_myBox.get('personal_details'));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      color: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onPressed: () {
                    context.router.pushAndPopUntil(const HomePageRoute(),
                        predicate: (route) => false);
                  },
                ),
                TopButton(
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () async {
                    await writeInDb();
                    context.router.push(const ResumeObjectiveRoute());
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Personal\nDetails',
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 214, 241, 255)),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: AppTextField(
                        controller: _firstName,
                        hintText: 'First Name',
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AppTextField(
                        controller: _lastName,
                        hintText: 'Last Name',
                      ))
                    ],
                  ),
                  AppTextField(
                    controller: _email,
                    hintText: 'Email Address',
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: AppTextField(
                        controller: _country,
                        hintText: 'Country',
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AppTextField(
                        controller: _city,
                        hintText: 'City',
                      )),
                    ],
                  ),
                  AppTextField(
                    controller: _designation,
                    hintText: 'Designation',
                  )
                ],
              ),
            ),
            // const SizedBox(height: 70),
            // Align(
            //   alignment: AlignmentDirectional.center,
            //   child: SizedBox(
            //     height: 80,
            //     width: MediaQuery.of(context).size.width / 3,
            //     child: TextButton.icon(
            //       onPressed: () {
            //         _formKey.currentState!.save();
            //         context.router.push(const ResumeObjectiveRoute());
            //       },
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
        )),
      ),
    );
  }
}
