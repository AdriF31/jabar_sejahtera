import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/ui/pages/donasi/donation_detail_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_card.dart';

class DonasiPage extends StatelessWidget {
  static const routeName = "/donasi-page";
  const DonasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Donasi'),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            itemCount: 10,
            itemBuilder: (context, index) {
              return DonasiCardList(
                  tag: 'img$index',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DonationDetailPage(tag: 'img$index')));
                  });
            }));
  }
}
