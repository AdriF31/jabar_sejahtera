import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/auth/register/register_page.dart';
import 'package:jabar_sejahtera/ui/main_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

import '../../../data/model/user_model.dart';
import '../../../helper/storage_core.dart';
import '../password/forgot_password_page.dart';

class SignInPage extends StatefulWidget {
  static const routeName = "/login-page";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _dio = Dio();
  final storage = StorageCore();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  LoginModel? loginModel;
  String email = 'user@gmail.com';
  String password = 'user123';

  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _dio.options = BaseOptions(
      baseUrl: "http://10.0.2.2:8000/api/v1",
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img_logo.png",
                        width: 285,
                        height: 90,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
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
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        title: 'Password',
                        hint: 'lebih dari 6 karakter',
                        icon: Icons.key_outlined,
                        isPassword: true,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ForgotPasswordPage.routeName);
                                },
                                child: const Text("Lupa Password?"))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomFilledButton(
                          title: 'Login',
                          color: buttonColor,
                          isLoading: isLoading,
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              doLogin();
                            }
                          }),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Belum punya akun?'),
                            const SizedBox(width: 4),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegisterPage.routeName);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: blueTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ))
                          ])
                    ]),
              ),
            ),
          ),
        ));
  }

  void doLogin() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.post("/login",
          data: {
            'email': _emailController.text,
            'password': _passwordController.text,
          },
          options: Options(headers: {"Accept": "application/json"}));
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        storage.saveAuthResponse(loginModel);

        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: loginModel!.message!);

        /// pindah ke homepage
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      } else {
        Fluttertoast.showToast(msg: loginModel!.message!);
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });

      if (e.response?.statusCode == 401) {
        Fluttertoast.showToast(msg: "Email atau password salah");
      } else {
        Fluttertoast.showToast(msg: e.message);
      }

    }
  }
}
