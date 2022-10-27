import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class RiwayatTransaksiPage extends StatelessWidget {
  static const routeName = '/riwayat-transaksi';
  const RiwayatTransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Transaksi'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        children: [
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10)),
                      child: Image.asset(
                        'assets/1.png',
                        height: 130,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Koin Untuk Adri',
                              style: blackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Total Bayar : Rp 300.000',
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Bayar Sebelum : 30 Februari 2020, 19.00',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: regular),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
