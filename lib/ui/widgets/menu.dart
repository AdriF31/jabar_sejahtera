import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class Menu extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;
  const Menu({Key? key, required this.icon, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 120,
        child: Column(children: [
          Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                icon,
                width: 34,
                height: 34,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(title,
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold))
        ]),
      ),
    );
  }
}
