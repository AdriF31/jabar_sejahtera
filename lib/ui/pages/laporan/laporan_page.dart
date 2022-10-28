import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class LaporanPage extends StatefulWidget {
  static const routeName = "/laporan-page";
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> laporan = [
    {
      "tahun": 2022,
      "bulan": "Januari",
    },
    {
      "tahun": 2022,
      "bulan": "Februari",
    },
    {
      "tahun": 2022,
      "bulan": "Maret",
    },
    {
      "tahun": 2022,
      "bulan": "April",
    },
    {
      "tahun": 2022,
      "bulan": "Mei",
    },
  ];

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
        ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text(
                      'Laporan Pemasukan ${laporan[index]['bulan']} 2022',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                ),
              );
            }),
        ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text(
                      'Laporan Pengeluaran ${laporan[index]['bulan']} 2022',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                ),
              );
            }),
      ]),
    );
  }
}
