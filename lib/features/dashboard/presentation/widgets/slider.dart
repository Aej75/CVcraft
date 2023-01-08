import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/title.dart';

class SliderWidget extends StatefulWidget {
  final List<dynamic> images;
  final VoidCallback onTap;
  final Widget? body;
  final bool image;
  const SliderWidget(
      {super.key,
      required this.images,
      required this.onTap,
      this.body,
      this.image = true});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget>
    with AutomaticKeepAliveClientMixin {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: CvTitle(title: 'Hot Picks'))),
        Expanded(
          flex: 4,
          child: Container(
            // height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // color: Color(0xffFE7A7A),
            ),
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(milliseconds: 2000),
                  enlargeFactor: 0.3,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  // aspectRatio: 1,
                  // height: MediaQuery.of(context).size.height / 3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: widget.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      elevation: 5,
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
                          onTap: widget.onTap,
                          child: Image.network(
                            i, fit: BoxFit.fitWidth,
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
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
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
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
