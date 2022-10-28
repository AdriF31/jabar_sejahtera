import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/constValue/const_value.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class LaporanPengeluaranPage extends StatefulWidget {
  const LaporanPengeluaranPage({super.key});

  @override
  State<LaporanPengeluaranPage> createState() => _LaporanPemasukanPageState();
}

class _LaporanPemasukanPageState extends State<LaporanPengeluaranPage> {
  TextEditingController _dateController = TextEditingController(text: '');

  List<String> items = ["Zakat", "Donasi"];
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              buttonWidth: 100,
              hint: Text('Jenis Pengeluaran'),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: blackTextStyle.copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as String;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: CustomFormField(
            title: 'Dari',
            icon: Icons.date_range_outlined,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              CustomFormField(title: 'Sampai', icon: Icons.date_range_outlined),
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 50,
                  child: Card(
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            ConstValue.laporan[index]['date_time'],
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                          Text(ConstValue.laporan[index]['jenis_pembayaran'],
                              style: blackTextStyle.copyWith(fontSize: 14)),
                          Text(ConstValue.laporan[index]['total'].toString(),
                              style: blackTextStyle.copyWith(fontSize: 14)),
                        ],
                      )),
                );
              }),
        ),
      ],
    );
  }
}
