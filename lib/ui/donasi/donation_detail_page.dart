import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pembayaran/metode_pembayaran_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';

class DonationDetailPage extends StatelessWidget {
  final Object tag;
  final List<Map> donasi;
  final int index;
  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  final TextEditingController totalController = TextEditingController(text: '');
  DonationDetailPage(
      {super.key,
      required this.tag,
      required this.donasi,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Donasi')),
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
                shape: const RoundedRectangleBorder(
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
                                  GestureDetector(
                                    onTap: () => Get.to(MetodePembayaranPage(
                                        jenisPembayaran: 'Donasi',
                                        totalPembayaran:
                                            formatter.format('5000'))),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatter.format('5000'),
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          const Icon(Icons.arrow_right)
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.to(MetodePembayaranPage(
                                        jenisPembayaran: 'Donasi',
                                        totalPembayaran:
                                            formatter.format('10000'))),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatter.format('10000'),
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          const Icon(Icons.arrow_right)
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.to(MetodePembayaranPage(
                                        jenisPembayaran: 'Donasi',
                                        totalPembayaran:
                                            formatter.format('25000'))),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatter.format('25000'),
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          const Icon(Icons.arrow_right)
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.to(MetodePembayaranPage(
                                        jenisPembayaran: 'Donasi',
                                        totalPembayaran:
                                            formatter.format('50000'))),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatter.format('50000'),
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          const Icon(Icons.arrow_right)
                                        ],
                                      ),
                                    ),
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
                                              inputFormatters: [formatter],
                                              controller: totalController,
                                              keyboardType:
                                                  TextInputType.number,
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
                                      onPressed: () => Get.to(
                                          MetodePembayaranPage(
                                              jenisPembayaran: 'Donasi',
                                              totalPembayaran: formatter.format(
                                                  totalController.text))),
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
                    donasi[index]['image'],
                    fit: BoxFit.fill,
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donasi[index]['title'],
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  donasi[index]['publisher'],
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: regular),
                ),
                const SizedBox(
                  height: 24,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    backgroundColor: greyColor,
                    color: progressBarColor,
                    minHeight: 10,
                    value: donasi[index]['terkumpul'] / donasi[index]['target'],
                    valueColor: AlwaysStoppedAnimation(progressBarColor),
                  ),
                ),
                const SizedBox(
                  height: 8,
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
                          formatter
                              .format(donasi[index]['terkumpul'].toString()),
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
                          formatter.format(donasi[index]['target'].toString()),
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
                  donasi[index]['deskripsi'],
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
