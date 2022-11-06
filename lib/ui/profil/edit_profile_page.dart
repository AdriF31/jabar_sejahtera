import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_buttons.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_form_field.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = "/edit-profile-page";
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profil'),
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
                  radius: 80,
                  backgroundColor: darkGreyColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  title: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextFormField(
                  title: 'Nama',
                  icon: Icons.person_outline,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextFormField(
                  title: 'No Telepon',
                  icon: Icons.key_outlined,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomFilledButton(
                  title: 'Simpan',
                  color: buttonColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
