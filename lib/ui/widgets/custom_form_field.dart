import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String? hint;
  final bool isPassword;
  final bool isReadOnly;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isShowTitle;
  const CustomFormField(
      {Key? key,
      required this.title,
      this.isPassword = false,
      required this.icon,
      this.controller,
      this.hint,
      this.isReadOnly = false,
      this.validator,
      this.isShowTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowTitle == true
            ? Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            : const SizedBox(
                height: 8,
              ),
        TextFormField(
          readOnly: isReadOnly,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              focusColor: greenColor,
              hintText: hint,
              prefixIcon: Icon(
                icon,
                color: blackColor,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              contentPadding: const EdgeInsets.all(12)),
          obscureText: isPassword,
        ),
      ],
    );
  }
}

class CurrencyInputField extends StatelessWidget {
  final String title;
  final String? hint;
  final CurrencyTextInputFormatter formatter;
  final TextEditingController? controller;
  final bool isShowTitle;
  const CurrencyInputField(
      {Key? key,
      required this.title,
      this.controller,
      this.hint,
      required this.formatter,
      this.isShowTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowTitle == true
            ? Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            : const SizedBox(
                height: 8,
              ),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [formatter],
          controller: controller,
          decoration: InputDecoration(
              focusColor: greenColor,
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: greenColor)),
              hintText: hint,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'RP',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: greenColor)),
              contentPadding: const EdgeInsets.all(12)),
        ),
      ],
    );
  }
}
