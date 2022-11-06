import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/event/event_page.dart';
import 'package:jabar_sejahtera/ui/home/home_page.dart';
import 'package:jabar_sejahtera/ui/profil/profile_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main-page";
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;
  List<Widget> page = const [HomePage(), EventPage(), ProfilePage()];

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home_outlined,
      "Beranda",
      whiteColor,
      labelStyle: blackTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.calendar_month_outlined,
      "Event",
      whiteColor,
      labelStyle: blackTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(Icons.person_outline, "Profil", whiteColor,
        labelStyle: blackTextStyle.copyWith(fontWeight: bold)),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: page[selectedPos],
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedIconColor: blackColor,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
