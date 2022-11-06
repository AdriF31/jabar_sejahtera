import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/auth/login/sign_in_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = "/onboarding-page";
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Bayar Zakatmu',
    'Mari Berdonasi',
    'Amanah dan Terpercaya',
  ];
  List<String> subtitles = [
    'Tunaikan kewajibanmu dengan membayar zakat ',
    'Sisihkan hartamu, mari donasi bersamaku :3',
    'Jabar Sejahtera menyalurkan zakat dan donasi anda secara tepat sasaran pada orang yang benar-benar membutuhkan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 93, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/img_onboarding1.png',
                  width: double.infinity,
                  height: 250,
                ),
                Image.asset(
                  'assets/img_onboarding2.png',
                  width: double.infinity,
                  height: 250,
                ),
                Image.asset(
                  'assets/img_onboarding3.png',
                  width: double.infinity,
                  height: 250,
                ),
              ],
              options: CarouselOptions(
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: regular),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == 0 ? buttonColor : greyColor),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == 1 ? buttonColor : greyColor),
                    ),
                    Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == 2 ? buttonColor : greyColor,
                        )),
                    const Spacer(),
                    CustomFilledButton(
                      width: 150,
                      height: 50,
                      radius: 25,
                      title: currentIndex != 2 ? 'Continue' : 'Login',
                      color: buttonColor,
                      onPressed: () {
                        currentIndex != 2
                            ? carouselController.nextPage()
                            : Navigator.pushNamedAndRemoveUntil(context,
                                SignInPage.routeName, (route) => false);
                      },
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
