import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/constValue/const_value.dart';
import 'package:jabar_sejahtera/ui/donasi/donation_detail_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_card.dart';

// ignore: must_be_immutable
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
            itemCount: ConstValue.donasi.length,
            itemBuilder: (context, index) {
              return DonasiCardList(
                  tag: 'imgg$index',
                  image: ConstValue.donasi[index]['image'],
                  publisher: ConstValue.donasi[index]['publisher'],
                  target: ConstValue.donasi[index]['target'],
                  terkumpul: ConstValue.donasi[index]['terkumpul'],
                  title: ConstValue.donasi[index]['title'],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DonationDetailPage(
                                  tag: 'imgg$index',
                                  donasi: ConstValue.donasi,
                                  index: index,
                                )));
                  });
            }));
  }
}
