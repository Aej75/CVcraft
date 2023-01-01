import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:cv_app/core/widgets/top_button.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    // readPdf();
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
                    Navigator.pop(context); // Pop the current route
                  },
                ),
                TopButton(
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Personal\nDetails',
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
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
                          child: TextFormField(
                        controller: _firstName,
                        decoration: const InputDecoration(
                            hintText: 'First Name',
                            border: OutlineInputBorder()),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: _lastName,
                        decoration: const InputDecoration(
                            hintText: 'Last Name',
                            border: OutlineInputBorder()),
                      ))
                    ],
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder()),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: _country,
                        decoration: InputDecoration(
                            hintText: 'Country',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: _city,
                        decoration: InputDecoration(
                            hintText: 'City',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ))
                    ],
                  ),
                  TextFormField(
                    controller: _designation,
                    decoration: InputDecoration(
                        hintText: 'Designation',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Align(
              alignment: AlignmentDirectional.center,
              child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width / 3,
                child: TextButton.icon(
                  onPressed: () {
                    _formKey.currentState!.save();
                    context.router.push(const ResumeObjectiveRoute());
                  },
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
        )),
      ),
    );
  }
}
