import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jabar_sejahtera/ui/auth/login/sign_in_page.dart';
import '../../../const/app_constant.dart';
import '../../../data/model/register_model.dart';
import '../../../shared/theme.dart';
import '../../main_page.dart';
import '../../widgets/custom_buttons.dart';
import '../../widgets/custom_form_field.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Dio _dio = Dio();
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController answerController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController questionController =
      TextEditingController(text: 'mamah');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  RegisterModel? registerModel;
  bool isLoading = false;

  final TextEditingController phoneController = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  void doRegister() async {
    setState(() {
      isLoading = true;
    });
    try {
      _dio.options = BaseOptions(baseUrl: baseUrl);
      var response = await _dio.post("/register",
          data: {
            'name': nameController.text,
            'phone_number': phoneController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': confirmPasswordController.text,
            'security_question': answerController.text,
          },
          options: Options(headers: {"Accept": "application/json"}));
      print(response.data);
      if (response.statusCode == 200) {
        registerModel = RegisterModel.fromJson(response.data);
        setState(() {
          isLoading = false;
        });
        if (registerModel?.status == true) {
          Fluttertoast.showToast(msg: registerModel!.message!);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (contex) => SignInPage()));
        }
        print(response.data);
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.response?.statusCode == 422) {
        Fluttertoast.showToast(msg: e.response?.data['message']);
      } else {
        Fluttertoast.showToast(msg: e.response?.data['message']);
      }
    }
  }

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
                CustomTextFormField(
                  title: 'Email',
                  icon: Icons.email_outlined,
                  hint: 'adri@gmail.com',
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Email Harus Diisi");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Masukkan email yang valid");
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  title: 'Nama',
                  icon: Icons.person_outline,
                  hint: 'Adri',
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Nama Harus Diisi");
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  title: 'No Telepon',
                  icon: Icons.phone_android_outlined,
                  hint: 'Adri',
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("No telepon Harus Diisi");
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  title: 'Password',
                  icon: Icons.key_outlined,
                  controller: passwordController,
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
                  title: 'Konfirmasi Password',
                  icon: Icons.key_outlined,
                  controller: confirmPasswordController,
                  isPassword: true,
                  hint: 'lebih dari 6 karakter',
                  validator: (value) {
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Password tidak sama";
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
                  isReadOnly: true,
                  controller: questionController,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  title: 'Jawaban',
                  icon: Icons.question_answer,
                  controller: answerController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Jawaban keamanan harus diisi");
                    }

                    return null;
                  },
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
                  isLoading: isLoading,
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      doRegister();
                    }
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
