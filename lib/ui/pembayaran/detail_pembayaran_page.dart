import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/home/home_page.dart';
import 'package:jabar_sejahtera/ui/main_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPembayaranPage extends StatelessWidget {
  // final String logo;
  // final String bank;
  // final String totalBayar;
  // final String pengirim;
  DetailPembayaranPage({
    super.key,
    // required this.pengirim,
    // required this.bank,
    // required this.logo,
    // required this.totalBayar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pembayaran'),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage())),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Selesai',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://demo.midtrans.com',
          onProgress: (progress) {},
        )

        //  Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Detail Pembayaran',
        //         style: blackTextStyle.copyWith(
        //           fontSize: 18,
        //         ),
        //       ),
        //       Divider(
        //         thickness: 2,
        //       ),
        //       Text(
        //         'Pengirim  : $pengirim',
        //         style: blackTextStyle.copyWith(fontSize: 16),
        //       ),
        //       const SizedBox(
        //         height: 8,
        //       ),
        //       Text(
        //         'Total Bayar  : $totalBayar',
        //         style: blackTextStyle.copyWith(fontSize: 16),
        //       ),
        //       const SizedBox(
        //         height: 8,
        //       ),
        //       Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Image.asset(logo),
        //               Text(
        //                 bank,
        //                 style: blackTextStyle.copyWith(
        //                     fontSize: 24, fontWeight: bold),
        //               )
        //             ],
        //           ),
        //           Text(
        //             "2455 8877 4567",
        //             style:
        //                 blackTextStyle.copyWith(fontSize: 30, fontWeight: bold),
        //           )
        //         ],
        //       ),
        //       Text('Batas Pembayaran  : 30 Februari 2022, 29.00')
        //     ],
        //   ),
        // ),
        );
  }
}
