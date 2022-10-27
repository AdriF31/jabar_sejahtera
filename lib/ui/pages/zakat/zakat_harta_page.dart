import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class ZakatHartaPage extends StatefulWidget {
  const ZakatHartaPage({super.key});

  @override
  State<ZakatHartaPage> createState() => _ZakatHartaPageState();
}

class _ZakatHartaPageState extends State<ZakatHartaPage> {
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
  CurrencyTextInputFormatter asetFormatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: '');
  CurrencyTextInputFormatter kendaraanFormatter =
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
        child: Column(
          children: [
            CurrencyInputField(
              controller: emasController
                ..text = hargaEmasFormatter.format(emasController.text),
              title: 'Harga Emas',
              hint: '854.000',
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
              title: 'Aset Berharga (saham, surat berharga, dll)',
              hint: '5.000.000',
              formatter: asetFormatter,
            ),
            const SizedBox(
              height: 8,
            ),
            CurrencyInputField(
              title: 'Aset lain (mobil, rumah)',
              hint: '5.000.000',
              formatter: kendaraanFormatter,
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
              title: 'Hitung Zakatmu',
              color: buttonColor,
              onPressed: () {
                int nishab =
                    (hargaEmasFormatter.getUnformattedValue().toInt() * 85 / 12)
                        .toInt();
                print(nishab);
                int totalHarta =
                    penghasilanFormatter.getUnformattedValue().toInt() +
                        asetFormatter.getUnformattedValue().toInt() +
                        kendaraanFormatter.getUnformattedValue().toInt() -
                        hutangFormatter.getUnformattedValue().toInt();
                int totalZakat = (totalHarta * 2.5 / 100).toInt();
                print(formatter.format(totalHarta.toString()));
                print(formatter.format(totalZakat.toString()));
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
                              bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                    '${formatter.format(totalZakat.toString())}',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 24, fontWeight: bold),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Container(
                                    height: 100,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: Colors.cyan.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(children: [
                                      Text(
                                        isNishab == true
                                            ? 'Anda wajib zakat karena harta anda sudah mencapai nishab zakat sebesar 85 gram emas'
                                            : 'Anda tidak wajib zakat karena harta anda belum mencapai nishab yaitu sebesar\n; ${formatter.format(nishab.toString())}',
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
                                      title: isNishab == true
                                          ? 'Bayar Zakat'
                                          : 'Infaq',
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
    );
    ;
  }
}
