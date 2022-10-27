import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pages/donasi/donation_detail_page.dart';
import 'package:jabar_sejahtera/ui/pages/event/event_detail_page.dart';
import 'package:jabar_sejahtera/ui/pages/event/event_page.dart';
import 'package:jabar_sejahtera/ui/pages/profil/profile_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_card.dart';
import 'package:jabar_sejahtera/ui/widgets/menu.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [HomePage(), EventPage(), ProfilePage()];

  final List<Widget> _carousel = [
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/1.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/2.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/3.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];

  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/img_logo.png',
                  width: 145,
                  height: 55,
                ),
                buildCarousel(),
                const SizedBox(
                  height: 30,
                ),
                buildMenu(),
                buildRekomendasiDonasi(),
                const SizedBox(
                  height: 20,
                ),
                buildEvent(),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCarousel() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: CarouselSlider(
            items: _carousel,
            options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                height: 150,
                autoPlayCurve: Curves.easeInOut,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            carouselController: carouselController,
          ),
        ),
        Center(
          child: CarouselIndicator(
            index: currentIndex,
            count: _carousel.length,
            color: greyColor,
            activeColor: buttonColor,
          ),
        ),
      ],
    );
  }

  Widget buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Menu(
            onTap: () => Navigator.pushNamed(context, '/zakat-page'),
            title: "Zakat",
            icon: "assets/ic_zakat.png",
          ),
          Menu(
            title: "Donasi",
            icon: "assets/ic_donasi.png",
            onTap: () {
              Navigator.pushNamed(context, '/donasi-page');
            },
          ),
          Menu(
            title: "Laporan",
            icon: "assets/ic_laporan.png",
          ),
        ],
      ),
    );
  }

  Widget buildRekomendasiDonasi() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Donasi Terbaru',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            Container(
                child: Row(
              children: [
                Text('Lihat Semua'),
                Icon(Icons.navigate_next),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return DonasiCard(
                tag: '$index',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DonationDetailPage(tag: '$index')));
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildEvent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event mendatang',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            Container(
                child: Row(
              children: [
                Text('Lihat Semua'),
                Icon(Icons.navigate_next),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: 10,
              itemBuilder: (context, index) {
                return EventCard(
                    tag: 'img$index',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EventDetailPage(tag: 'img$index')));
                    });
              }),
        )
      ],
    );
  }
}
