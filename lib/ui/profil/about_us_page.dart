import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class AboutUsPage extends StatelessWidget {
  static const routeName = "/about-us-page";
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Kami')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/img_logo.png',
                width: 250,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Jabar Sejahtera',
              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Jabar Sejahtera merupakan lembaga amil zakat dan donasi terpaercaya yang telah terbukti amanah dalam penyaluran zakat dan donasi',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Hubungi Kami',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            const Divider(),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/ic_email.svg'),
                Text(
                  "jabarsejahtera@gmail.com",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/ic_wa.svg'),
                Text(
                  "jabarsejahtera@gmail.com",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/ic_ig.svg'),
                Text(
                  "@jabarsejahtera",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Hubungi Kami',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            const Divider(),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Icon(
                  Icons.email_outlined,
                  size: 38,
                ),
                Text(
                  "jabarsejahtera@gmail.com",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
