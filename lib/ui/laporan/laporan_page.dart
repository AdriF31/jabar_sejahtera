import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/laporan/laporan_pemasukan_page.dart';
import 'package:jabar_sejahtera/ui/laporan/laporan_pengeluaran_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class LaporanPage extends StatefulWidget {
  static const routeName = "/laporan-page";
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan'),
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
                      'Pemasukkan',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.attach_money_outlined),
                    Text(
                      'Pengeluaran',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ]),
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Expanded(child: LaporanPemasukanPage()),
        Expanded(child: LaporanPengeluaranPage()),
      ]),
    );
  }
}
