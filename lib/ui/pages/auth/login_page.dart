import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jabar_sejahtera/data/user_model.dart';
import 'package:jabar_sejahtera/helper/storage_core.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pages/main_page.dart';
import 'package:jabar_sejahtera/ui/pages/home/home_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login-page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // var _dio = Dio();
  // final storage = StorageCore();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  // LoginModel? loginModel;
  String email = 'user@gmail.com';
  String password = 'user123';

  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _dio.options = BaseOptions(
    //   baseUrl: "http://10.0.2.2:8000/api/v1",
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: isLoading == false
          ? Center(
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
                          CustomFormField(
                            controller: _emailController,
                            title: 'Email',
                            hint: 'adry@gmail.com',
                            icon: Icons.email_outlined,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Email Harus Diisi");
                              }
                              // reg expression for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Masukkan email yang valid");
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomFormField(
                            controller: _passwordController,
                            title: 'Password',
                            hint: 'lebih dari 6 karakter',
                            icon: Icons.key_outlined,
                            isPassword: true,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{6,}$');
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
                                    onTap: () {},
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
                              onPressed: () {
                                if (formKey.currentState?.validate() == true) {
                                  print('ok');
                                  if (_emailController.text == email &&
                                      _passwordController.text == password) {
                                    Fluttertoast.showToast(
                                        msg: "Berhasil login",
                                        backgroundColor: greenColor);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "email atau password salah",
                                        backgroundColor: Colors.red);
                                  }
                                  // print(loginModel);
                                  // doLogin(_emailController.text,
                                  //     _passwordController.text);
                                  // if (loginModel!.message ==
                                  //     "Berhasil login.") {
                                  //   Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const BottomNavBar()));
                                  // } else {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return AlertDialog(
                                  //           title:
                                  //               Text('${loginModel!.message}'),
                                  //         );
                                  //       });
                                  // }
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
                                      Navigator.pushNamed(context, '/sign-up');
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
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // void doLogin(String? email, String? password) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var response = await _dio.post("/login",
  //         data: {"email": email, "password": password},
  //         options: Options(headers: {"Accept": "application/json"}));
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         loginModel = LoginModel.fromJson(response.data);
  //         storage.saveAuthResponse(loginModel);
  //         isLoading = false;
  //       });
  //       print("token : ${storage.getAccessToken()}");
  //     }
  //   } on DioError catch (e) {
  //     setState(() {
  //       isLoading = false;

  //     });
  //     print(e.message);
  //   }
  // }
}
