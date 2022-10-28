import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pages/donasi/donasi_page.dart';
import 'package:jabar_sejahtera/ui/pages/donasi/donation_detail_page.dart';
import 'package:jabar_sejahtera/ui/pages/event/event_detail_page.dart';
import 'package:jabar_sejahtera/ui/pages/event/event_page.dart';
import 'package:jabar_sejahtera/ui/pages/laporan/laporan_page.dart';
import 'package:jabar_sejahtera/ui/pages/profil/profile_page.dart';
import 'package:jabar_sejahtera/ui/pages/zakat/zakat.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_card.dart';
import 'package:jabar_sejahtera/ui/widgets/menu.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [const HomePage(), const EventPage(), const ProfilePage()];

  List<Map<String, dynamic>> donasi = [
    {
      "image": "assets/images/img_donasi1.png",
      "title": "Koin untuk adri",
      "publisher": "Jabar Sejahtera",
      "terkumpul": 2500000,
      "target": 10000000,
      "deskripsi":
          "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
    },
    {
      "image": "assets/images/img_donasi2.png",
      "title": "Bantu saya",
      "publisher": "Jabar Sejahtera",
      "terkumpul": 3000000,
      "target": 10000000,
      "deskripsi":
          "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
    },
    {
      "image": "assets/images/img_donasi3.png",
      "title": "Bedah rumah",
      "publisher": "Jabar Sejahtera",
      "terkumpul": 3360000,
      "target": 14000000,
      "deskripsi":
          "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
    },
    {
      "image": "assets/images/img_donasi4.png",
      "title": "Sedekah Bantu Makan Santri jjjjjj",
      "publisher": "Jabar Sejahtera",
      "terkumpul": 30000000,
      "target": 124000000,
      "deskripsi":
          "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
    },
    {
      "image": "assets/images/img_donasi5.png",
      "title": "Koin untuk adri",
      "publisher": "Jabar Sejahtera",
      "terkumpul": 300000,
      "target": 10000000,
      "deskripsi":
          "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
    },
  ];

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
            onTap: () => Navigator.pushNamed(context, ZakatPage.routeName),
            title: "Zakat",
            icon: "assets/ic_zakat.png",
          ),
          Menu(
            title: "Donasi",
            icon: "assets/ic_donasi.png",
            onTap: () {
              Navigator.pushNamed(context, DonasiPage.routeName);
            },
          ),
          Menu(
            title: "Laporan",
            icon: "assets/ic_laporan.png",
            onTap: () {
              Navigator.pushNamed(context, LaporanPage.routeName);
            },
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DonasiPage.routeName);
              },
              child: Row(
                children: const [
              Text('Lihat Semua'),
              Icon(Icons.navigate_next),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: donasi.length,
            itemBuilder: (context, index) {
              return DonasiCard(
                tag: '$index',
                title: donasi[index]['title'],
                image: donasi[index]['image'],
                publisher: donasi[index]['publisher'],
                terkumpul: donasi[index]['terkumpul'],
                target: donasi[index]['target'],
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationDetailPage(
                                tag: '$index',
                                donasi: donasi,
                                index: index,
                              )));
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
            GestureDetector(
              onTap: () {},
              child: Row(
                children: const [
              Text('Lihat Semua'),
              Icon(Icons.navigate_next),
                ],
              ),
            )
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
