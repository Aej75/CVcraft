import 'package:cv_app/core/widgets/blueprint.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class EditTempletPage extends StatefulWidget {
  const EditTempletPage({super.key});

  @override
  State<EditTempletPage> createState() => _EditTempletPageState();
}

class _EditTempletPageState extends State<EditTempletPage> {
  final TextEditingController _controller = TextEditingController();
  final int _scale = 1;
  double imageHeight = 0.0;
  double imageWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    return BluePrint(
      background: Colors.white,
      body: Zoom(
        maxZoomWidth: MediaQuery.of(context).size.width,
        maxZoomHeight: MediaQuery.of(context).size.height,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/templets/cv.jpg',
                fit: BoxFit.fitWidth,
              ),
              SingleChildScrollView(
                child: Column(children: const []),
              )
            ],
          ),
        ),
      ),
    );
  }
}
