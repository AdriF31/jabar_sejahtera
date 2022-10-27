import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';
import 'package:jabar_sejahtera/ui/widgets/menu.dart';

class CekWidget extends StatefulWidget {
  const CekWidget({Key? key}) : super(key: key);

  @override
  State<CekWidget> createState() => _CekWidgetState();
}

class _CekWidgetState extends State<CekWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ngetes WIdget gan'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 250,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(color: whiteColor, boxShadow: [
            BoxShadow(
                color: blackColor,
                spreadRadius: 1,
                blurRadius: 1,
                blurStyle: BlurStyle.outer)
          ]),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                  width: 300,
                  height: 200,
                  color: whiteColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          color: greenColor,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              color: blackColor,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              color: blueColor,
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
            ],
          ),
          Menu(icon: 'assets/ic_zakat.png', title: 'zakat'),
          CustomFilledButton(title: 'ini button', color: greenColor),
          const CustomFormField(
 
            title: 'Hai Aku form',
            icon: Icons.forest,
          ),
          const SizedBox(
            height: 10,
          ),
       
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.red, blueColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                )),
            child: Center(
              child: Text(
                'Ini Linear button :)',
                style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
