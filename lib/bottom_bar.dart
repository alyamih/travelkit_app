import 'package:flutter/material.dart';
import 'package:travelkit_app/pages/home_page.dart';
import 'package:travelkit_app/pages/settings_page.dart';

enum EPageOnSelect { home, settings }

EPageOnSelect page = EPageOnSelect.home;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5).withOpacity(0.08),
        border: Border(
            top: BorderSide(color: const Color(0xFFF5F5F5).withOpacity(0.14))),
      ),
      padding: const EdgeInsets.fromLTRB(50, 7, 50, 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);

              page = EPageOnSelect.home;
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 55,
                child: Column(
                  children: [
                    Image.asset(
                      page == EPageOnSelect.home
                          ? 'assets/home_on.png'
                          : 'assets/home_off.png',
                    ),
                    Text(
                      'Baggage',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: page == EPageOnSelect.home
                              ? Colors.white
                              : const Color(0xFFF5F5F5).withOpacity(0.4),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                  (route) => false);

              page = EPageOnSelect.settings;

              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  children: [
                    Image.asset(
                      page == EPageOnSelect.settings
                          ? 'assets/cogs_on.png'
                          : 'assets/cogs_off.png',
                    ),
                    Text(
                      'Settings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: page == EPageOnSelect.settings
                              ? Colors.white
                              : const Color(0xFFF5F5F5).withOpacity(0.4),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
