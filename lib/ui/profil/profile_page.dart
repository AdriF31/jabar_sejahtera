import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/const/app_constant.dart';
import 'package:jabar_sejahtera/data/model/profile_model.dart';
import 'package:jabar_sejahtera/helper/storage_core.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/auth/login/sign_in_page.dart';
import 'package:jabar_sejahtera/ui/profil/about_us_page.dart';
import 'package:jabar_sejahtera/ui/profil/edit_profile_page.dart';
import 'package:jabar_sejahtera/ui/transaksi/riwayat_transaksi_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = StorageCore();
  final _dio = Dio();
  ProfileModel profileModel = ProfileModel();
  void getProfile() async {
    try {
      var res = await _dio.get('/users/${storage.getCurrentUserId()}',
          options: Options(headers: {
            "Accept": "application/json",
            'Authorization': "Bearer ${storage.getAccessToken()}"
          }));

      if (res.statusCode == 200) {
        setState(() {
          profileModel = ProfileModel.fromJson(res.data);
        });
      }
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio.options = BaseOptions(baseUrl: baseUrl);

    print(profileModel.message);
    print(storage.getCurrentUserId());
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: blackTextStyle,
        ),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 145,
                  height: 145,
                  child: CircleAvatar(
                    child: Image.network(
                        profileModel.data?.userDetail?.image ?? 'https://'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  profileModel.data?.name ?? 'user',
                  style:
                      blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  profileModel.data?.email ?? '',
                  style:
                      blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                Divider(
                  color: blackColor,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomWhiteButton(
                  title: 'Ubah Profil',
                  icon: Icons.person_outline,
                  onTap: () {
                    Navigator.pushNamed(context, EditProfilePage.routeName);
                  },
                ),
                CustomWhiteButton(
                  title: 'Riwayat Transaksi',
                  icon: Icons.history_outlined,
                  onTap: () {
                    Navigator.pushNamed(
                        context, RiwayatTransaksiPage.routeName);
                  },
                ),
                CustomWhiteButton(
                  title: 'Tentang Kami',
                  icon: Icons.info_outline,
                  onTap: () =>
                      Navigator.pushNamed(context, AboutUsPage.routeName),
                ),
                CustomWhiteButton(
                  title: 'Logout',
                  icon: Icons.logout_outlined,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(
                              child: Text(
                                'Logout',
                                style: blackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                            ),
                            content: Text(
                              'Apakah anda ingin keluar?',
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: regular),
                            ),
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            actions: [
                              GestureDetector(
                                onTap: () {
                                  storage.deleteAuthResponse();
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      SignInPage.routeName, (route) => false);
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Ya',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Tidak',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  )),
                                ),
                              ),
                            ],
                            // actions: [
                            //   CustomFilledButton(title: 'ya', color: Colors.red),
                            //   CustomBorderButton(
                            //     title: 'tidak',
                            //   )
                            // ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
