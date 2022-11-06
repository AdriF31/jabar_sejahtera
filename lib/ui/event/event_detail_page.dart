import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/constValue/const_value.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class EventDetailPage extends StatelessWidget {
  final String tag;
  final int index;
  const EventDetailPage({super.key, required this.tag, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Event')),
      body: ListView(
        children: [
          SizedBox(
              height: 204,
              child: Hero(
                  tag: tag,
                  child: Image.asset(
                    ConstValue.event[index]['image'],
                    fit: BoxFit.fill,
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ConstValue.event[index]['waktu'],
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  ConstValue.event[index]['tempat'],
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  ConstValue.event[index]['title'],
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
                  style: blackTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 4,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
