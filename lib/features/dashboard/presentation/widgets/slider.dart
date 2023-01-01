import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.gr.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget>
    with AutomaticKeepAliveClientMixin {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<String> images = [
    'https://i0.wp.com/psdfreedownload.com/wp-content/uploads/2017/05/Modern_Simple_Resume_Template_PSD_Full_View.jpg?w=1200&ssl=1',
    'https://www.mycvstore.com/wp-content/uploads/2019/02/Professional-CV-MS-Word-Template.jpg',
    'https://www.thegreenerleithsocial.org/wp-content/uploads/2019/11/45-free-modern-resume-cv-templates-minimalist-simple-for-microsoft-word-resume-template-free.jpg',
    'https://www.resumebuilder.org/wp-content/themes/resumebuilder-theme/images/resumes/Europass-CV-Template-1.png',
    'https://i.pinimg.com/originals/0e/6e/15/0e6e150aa3e53e1314a93756532e39ff.gif'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // color: Colors.red,
          ),
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                enlargeFactor: 0.7,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                aspectRatio: 1.5,
                height: MediaQuery.of(context).size.height / 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        // gradient: const RadialGradient(
                        //   colors: [Colors.white60, Colors.black38],
                        // ),
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context.router.push(const EditTempletPageRoute());
                        },
                        child: Image.network(
                          i,
                          fit: BoxFit.cover,
                          // color: Colors.white.withOpacity(0.5),
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: (_current == entry.key)
                  ? Container(
                      width: 25.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                          color: kDarkBlueColor),
                    )
                  : Container(
                      width: 10.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
