import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/zakat/zakat_harta_page.dart';
import 'package:jabar_sejahtera/ui/zakat/zakat_penghasilan_page.dart';

class ZakatPage extends StatefulWidget {
  static const routeName = "/zakat-page";
  const ZakatPage({super.key});

  @override
  State<ZakatPage> createState() => _ZakatPageState();
}

class _ZakatPageState extends State<ZakatPage> with TickerProviderStateMixin {
  late TabController tabController;
  bool isBayar = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zakat'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TabBar(
              controller: tabController,
              indicatorWeight: 5,
              indicatorColor: buttonColor,
              tabs: [
                Column(
                  children: [
                    const Icon(Icons.attach_money_outlined),
                    Text(
                      'Zakat Harta',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.attach_money_outlined),
                    Text(
                      'Zakat Penghasilan',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ]),
        ),
      ),
      body: TabBarView(
          controller: tabController,
          children: const [ZakatHartaPage(), ZakatPenghasilanPage()]),
    );
  }
}
