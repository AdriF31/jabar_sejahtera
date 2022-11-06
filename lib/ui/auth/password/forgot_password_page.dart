import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/auth/password/reset_password_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "/forgot-password-page";
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _questionController =
      TextEditingController(text: 'man robbuka');
  final TextEditingController _answerController =
      TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
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
              controller: _emailController,
              title: 'Email',
              hint: 'adry@gmail.com',
              icon: Icons.email_outlined,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Email Harus Diisi");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Masukkan email yang valid");
                }
                if (_emailController.text != "user@gmail.com") {
                  return ("email yang anda masukkan salah");
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              title: 'Pertanyaan Kemanan',
              icon: Icons.question_mark_outlined,
              controller: _questionController,
              isReadOnly: true,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              title: 'Jawaban',
              icon: Icons.question_answer,
              hint: 'Allah',
              controller: _answerController,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("jawaban keamanan harus diisi");
                }
                if (_answerController.text != "Allah") {
                  return ("Jawaban keamanan salah");
                }
                return null;
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomFilledButton(
              title: 'Simpan',
              color: buttonColor,
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  Navigator.pushNamed(context, ResetPasswordPage.routeName);
                } else {
                  Fluttertoast.showToast(
                      msg: "jawaban keamanan salah",
                      backgroundColor: Colors.red);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
