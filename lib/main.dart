import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/helper/scroll_configuration.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pages/profil/about_us_page.dart';
import 'package:jabar_sejahtera/ui/pages/main_page.dart';
import 'package:jabar_sejahtera/ui/pages/donasi/donasi_page.dart';
import 'package:jabar_sejahtera/ui/pages/profil/edit_profile_page.dart';
import 'package:jabar_sejahtera/ui/pages/event/event_detail_page.dart';
import 'package:jabar_sejahtera/ui/pages/home/home_page.dart';
import 'package:jabar_sejahtera/ui/pages/auth/login_page.dart';
import 'package:jabar_sejahtera/ui/pages/onboarding/onboarding_page.dart';
import 'package:jabar_sejahtera/ui/pages/auth/sign_up_page.dart';
import 'package:jabar_sejahtera/ui/pages/splashscreen.dart';
import 'package:jabar_sejahtera/ui/pages/transaksi/riwayat_transaksi_page.dart';
import 'package:jabar_sejahtera/ui/pages/zakat/zakat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        child =
            ScrollConfiguration(behavior: IosScrollBehavior(), child: child!);
        return child;
      },
      title: 'Jabar Sejahtera',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        HomePage.routeName: (context) => const HomePage(),
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        DonasiPage.routeName: (context) => const DonasiPage(),
        MainPage.routeName: (context) => const MainPage(),
        EditProfilePage.routeName: (context) => const EditProfilePage(),
        // '/event-detail': (context) => const EventDetailPages(),
        AboutUsPage.routeName: (context) => const AboutUsPage(),
        ZakatPage.routeName: (context) => const ZakatPage(),
        RiwayatTransaksiPage.routeName: (context) =>
            const RiwayatTransaksiPage()
      },
      theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          appBarTheme: AppBarTheme(
              backgroundColor: greenColor,
              centerTitle: true,
              elevation: 0,
              iconTheme: IconThemeData(
                color: whiteColor,
              ),
              titleTextStyle:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: medium))),
    );
  }
}
