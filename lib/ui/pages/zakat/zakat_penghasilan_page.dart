import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class ZakatPenghasilanPage extends StatefulWidget {
  const ZakatPenghasilanPage({super.key});

  @override
  State<ZakatPenghasilanPage> createState() => _ZakatPenghasilanPageState();
}

class _ZakatPenghasilanPageState extends State<ZakatPenghasilanPage> {
  bool isBayar = false;
  CurrencyTextInputFormatter hargaEmasFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    locale: 'id',
    symbol: '',
  );
  CurrencyTextInputFormatter penghasilanFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
  CurrencyTextInputFormatter asetFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
  CurrencyTextInputFormatter kendaraanFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
  CurrencyTextInputFormatter hutangFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
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
                formatter: penghasilanFormatter,
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
              Visibility(
                visible: isBayar,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              CustomFilledButton(
                title: isBayar == true ? 'bayar hey' : 'Hitung',
                color: buttonColor,
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
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
                                      'Hasil Perhitungan Zakat Penghasilan',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 18, fontWeight: semiBold),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      'Rp 350.000',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 24, fontWeight: bold),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Container(
                                      height: 80,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: Colors.cyan.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(children: [
                                        Text(
                                          'Harta anda sudah mencapai nishab zakat sebesar 85 gram emas',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16),
                                          textAlign: TextAlign.justify,
                                        )
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    CustomFilledButton(
                                        title: 'Bayar Zakat',
                                        color: buttonColor),
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
    ;
  }
}
