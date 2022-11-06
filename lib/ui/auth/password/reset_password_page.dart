import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/auth/login/sign_in_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class ResetPasswordPage extends StatefulWidget {
  static const routeName = "/reset-password-page";
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController =
      TextEditingController(text: '');
  final TextEditingController _confirmNewPasswordController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lupa Password')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          children: [
            CustomTextFormField(
              controller: _newPasswordController,
              title: 'Password baru',
              icon: Icons.key_outlined,
              isPassword: true,
              hint: 'lebih dari 6 karakter',
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password harus diisi");
                }
                if (!regex.hasMatch(value)) {
                  return ("Masukkan password yang valid(min. 6 karakter)");
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              controller: _confirmNewPasswordController,
              title: 'Konfirmasi Password baru',
              icon: Icons.key_outlined,
              isPassword: true,
              hint: 'lebih dari 6 karakter',
              validator: (value) {
                if (_confirmNewPasswordController.text !=
                    _newPasswordController.text) {
                  return "Password tidak sama";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            CustomFilledButton(
              title: 'Simpan Password',
              color: buttonColor,
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  Navigator.pushNamed(context, SignInPage.routeName);
                  Fluttertoast.showToast(
                      msg: 'Password berhasil diubah',
                      backgroundColor: greenColor);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
