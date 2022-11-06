import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jabar_sejahtera/constValue/const_value.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pembayaran/detail_pembayaran_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:jabar_sejahtera/constValue/const_value.dart';
// import 'package:jabar_sejahtera/shared/theme.dart';
// import 'package:jabar_sejahtera/ui/pages/pembayaran/detail_pembayaran_page.dart';

class MetodePembayaranPage extends StatefulWidget {
  static const routeName = "/metode-pembayaran-page";
  final String jenisPembayaran;
  final String totalPembayaran;
  const MetodePembayaranPage(
      {super.key,
      required this.jenisPembayaran,
      required this.totalPembayaran});

  @override
  State<MetodePembayaranPage> createState() => _MetodePembayaranPageState();
}

class _MetodePembayaranPageState extends State<MetodePembayaranPage> {
  TextEditingController nameController = TextEditingController(text: 'user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Metode Pembayaran")),
      // body: WebView(
      //   javascriptMode: JavascriptMode.unrestricted,
      //   initialUrl: 'https://demo.midtrans.com',
      //   onProgress: (progress) {},
      // )

      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Detail Pembayaran',
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
          Divider(color: blackColor, thickness: 1),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                'Jenis Pembayaran   : ',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                widget.jenisPembayaran,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Text(
                'Total Bayar      : ',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                widget.totalPembayaran,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Data Diri',
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
          Divider(color: blackColor, thickness: 1),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                focusColor: greenColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenColor)),
                hintText: 'pemberi zakat',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: greenColor)),
                contentPadding: const EdgeInsets.all(12)),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Metode Pembayaran',
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
          Divider(color: blackColor, thickness: 1),
          const SizedBox(
            height: 12,
          ),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.all(24),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/midtrans.png',
                    width: 120,
                  ),
                  Text(
                    "Midtrans",
                    style:
                        blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: CustomFilledButton(
          onPressed: () => Get.to(DetailPembayaranPage()),
          color: buttonColor,
          title: 'Bayar',
        ),
      ),
    );
  }
}
