
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final List<String> titles = [
    'Bayar Zakatmu',
    'Mari Berdonasi',
    'Amanah dan Terpercaya',
  ];
 final List<String> subtitles = [
    'Tunaikan kewajibanmu dengan membayar zakat ',
    'Sisihkan hartamu, mari donasi bersamaku :3',
    'Jabar Sejahtera menyalurkan zakat dan donasi anda secara tepat sasaran pada orang yang benar-benar membutuhkan',
  ];
 final List<Widget> _carousel = [
    Image.asset(
      'assets/1.png',
    ),
    Image.asset(
      'assets/2.png',
    ),
    Image.asset(
      'assets/3.png',
    ),
  ];
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CarouselSlider(
            carouselController: carouselController,
            items: _carousel,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            )),
        Text(subtitles[currentIndex])
      ],
    ));
  }
}
