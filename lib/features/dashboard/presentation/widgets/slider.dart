import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

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
            items: widget.images.map((i) {
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
                        onTap: widget.onTap,
                        child: widget.image ? returnImage(i) : widget.body,
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
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget returnImage(e) {
  return Image.network(
    e, fit: BoxFit.cover,
    // color: Colors.white.withOpacity(0.5),
    colorBlendMode: BlendMode.modulate,
  );
}

Widget returnWidget(e) {
  return Container(
    child: e,
  );
}
