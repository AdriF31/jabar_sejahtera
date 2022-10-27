import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';

class DonationDetailPage extends StatelessWidget {
  final Object tag;
  const DonationDetailPage({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Donasi')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 10,
        ),
        child: CustomFilledButton(
          color: buttonColor,
          title: 'Donasi Sekarang',
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                context: context,
                isScrollControlled: true,
                builder: (BuildContext bc) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter state) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                          padding: const EdgeInsets.all(24),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Masukkan Jumlah ',
                                            style: blackTextStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(12),
                                                  border: InputBorder.none,
                                                  alignLabelWithHint: false,
                                                  filled: true,
                                                  fillColor: greyColor),
                                            ),
                                          ),
                                          Text(
                                            'Minimal Rp 1000 ',
                                            style: blackTextStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ],
                                      )),
                                  CustomFilledButton(
                                      title: 'Bayar Sekarang',
                                      color: buttonColor)
                                ]),
                          )),
                    );
                  });
                });
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 204,
              child: Hero(
                  tag: tag,
                  child: Image.asset(
                    'assets/1.png',
                    fit: BoxFit.fill,
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Relawan Baik Kita Bisa',
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    backgroundColor: greyColor,
                    color: progressBarColor,
                    minHeight: 5,
                    value: 0.5,
                    valueColor: AlwaysStoppedAnimation(progressBarColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Terkumpul',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          'Rp 200.000',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'dibutuhkan',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          'Rp 1.600..000',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Penyaluran Bersama #RelawanBaik Kitabisa adalah program yang kami buka bagi donatur setia aplikasi Kitabisa, agar berkesampatan menjadi relawan di berbagai kegiatan penyaluran bantuan. Program ini bertujuan agar donatur bisa melihat langsung dampak yang mereka berikan dari tiap donasi yang masuk melalui aplikasi Kitabisa. Selain itu, mereka yang terpilih menjadi #RelawanBaik juga bisa berinteraksi dan mendengar perjuangan di setiap cerita penggalang dana di aplikasi Kitabisa. ",
                  style: blackTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
