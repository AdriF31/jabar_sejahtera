import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pembayaran/metode_pembayaran_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class ZakatPenghasilanPage extends StatefulWidget {
  const ZakatPenghasilanPage({super.key});

  @override
  State<ZakatPenghasilanPage> createState() => _ZakatPenghasilanPageState();
}

class _ZakatPenghasilanPageState extends State<ZakatPenghasilanPage> {
  bool isNishab = false;
  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  CurrencyTextInputFormatter hargaEmasFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    locale: 'id',
    symbol: '',
  );
  CurrencyTextInputFormatter penghasilanFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
  CurrencyTextInputFormatter penghasilanLainFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');

  CurrencyTextInputFormatter hutangFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
  final TextEditingController emasController =
      TextEditingController(text: '960000');
  String totalZakat = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              CurrencyInputField(
                controller: emasController
                  ..text = hargaEmasFormatter.format(emasController.text),
                title: 'Harga Emas',
                hint: '5.000.000',
                formatter: hargaEmasFormatter,
              ),
              const SizedBox(
                height: 8,
              ),
              CurrencyInputField(
                title: 'Penghasilan Perbulan',
                hint: '5.000.000',
                formatter: penghasilanFormatter,
              ),
              const SizedBox(
                height: 8,
              ),
              CurrencyInputField(
                title: 'Penghasilan Lain',
                hint: '5.000.000',
                formatter: penghasilanLainFormatter,
              ),
              const SizedBox(
                height: 8,
              ),
              CurrencyInputField(
                title: 'Cicilan / Hutang',
                hint: '5.000.000',
                formatter: hutangFormatter,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFilledButton(
                title: 'Hitung',
                color: buttonColor,
                onPressed: () {
                  int nishab =
                      hargaEmasFormatter.getUnformattedValue().toInt() *
                          85 ~/
                          12;
                  debugPrint(nishab.toString());
                  int totalHarta = penghasilanFormatter
                          .getUnformattedValue()
                          .toInt() +
                      penghasilanLainFormatter.getUnformattedValue().toInt() -
                      hutangFormatter.getUnformattedValue().toInt();
                  int totalZakat = totalHarta * 2.5 ~/ 100;
                  debugPrint(formatter.format(totalHarta.toString()));
                  debugPrint(formatter.format(totalZakat.toString()));
                  if (totalHarta < nishab || nishab == 0) {
                    setState(() {
                      isNishab = false;
                    });
                  } else {
                    setState(() {
                      isNishab = true;
                    });
                  }
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext bc) {
                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter state) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      margin: const EdgeInsets.only(
                                          bottom: 20, top: 10),
                                      decoration: BoxDecoration(
                                          color: blackColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Text(
                                      'Hasil Perhitungan Zakat Harta',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 18, fontWeight: semiBold),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      formatter.format(totalZakat.toString()),
                                      style: blackTextStyle.copyWith(
                                          fontSize: 24, fontWeight: bold),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: Colors.cyan.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(children: [
                                        Text(
                                          isNishab == true
                                              ? 'Anda wajib zakat karena harta anda sudah mencapai nishab zakat sebesar 85 gram emas'
                                              : 'Anda tidak wajib zakat karena harta anda belum mencapai nishab yaitu sebesar\n ${formatter.format(nishab.toString())}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    CustomFilledButton(
                                      title: isNishab == true
                                          ? 'Bayar Zakat'
                                          : 'Infaq',
                                      color: buttonColor,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MetodePembayaranPage(
                                                      jenisPembayaran:
                                                          'Zakat Harta',
                                                      totalPembayaran: formatter
                                                          .format(totalZakat
                                                              .toString()),
                                                    )));
                                      },
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ]),
                                )),
                          );
                        });
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
