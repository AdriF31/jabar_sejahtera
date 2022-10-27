import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = "/sign-up-page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 24,
                ),
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/1.png'),
                  radius: 50,
                  backgroundColor: darkGreyColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomFormField(
                  title: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomFormField(
                  title: 'Nama',
                  icon: Icons.person_outline,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomFormField(
                  title: 'Password',
                  icon: Icons.key_outlined,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomFormField(
                  title: 'Konfirmasi Password',
                  icon: Icons.key_outlined,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomFormField(
                  title: 'Pertanyaan Kemanan',
                  icon: Icons.question_mark_outlined,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomFormField(
                  title: 'Jawaban',
                  icon: Icons.question_answer,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomFilledButton(
                  title: 'Sign Up',
                  color: buttonColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Punya akun?'),
                  const SizedBox(width: 4),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: blueTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ))
                ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
