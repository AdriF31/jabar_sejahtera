import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/sign-up-page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController questionController =
      TextEditingController(text: 'man robbuka');
  final TextEditingController _passwordController = TextEditingController(text: '');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  hint: 'adri@gmail.com',
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomFormField(
                  title: 'Nama',
                  icon: Icons.person_outline,
                  hint: 'Adri',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  title: 'Password',
                  icon: Icons.key_outlined,
                  isPassword: true,
                  hint: 'lebih dari 6 karakter',
                  validator: (value) {
                    RegExp regex =  RegExp(r'^.{6,}$');
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
                CustomFormField(
                  title: 'Konfirmasi Password',
                  icon: Icons.key_outlined,
                  isPassword: true,
                  hint: 'lebih dari 6 karakter',
                  validator: (value) {
                    if (_confirmPasswordController.text !=
                        _passwordController.text) {
                      return "Password tidak sama";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  title: 'Pertanyaan Kemanan',
                  icon: Icons.question_mark_outlined,
                  controller: questionController,
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
