import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelkit_app/bottom_bar.dart';
import 'package:travelkit_app/pages/show_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A89A5),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 65, bottom: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Give us 5 star',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Your feedback helps us to improve',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Image.asset('assets/settings.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 13, 8, 13),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ReadTermsOrPrivacyScreenView(
                                          link: 'google.com',
                                        )),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/terms.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Terms of use',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white.withOpacity(0.4),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
                            child: Divider(
                              color: Colors.white.withOpacity(0.08),
                              height: 1,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ReadTermsOrPrivacyScreenView(
                                          link: 'google.com',
                                        )),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/privacy.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Privacy policy',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white.withOpacity(0.4),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
                            child: Divider(
                              color: Colors.white.withOpacity(0.08),
                              height: 1,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ReadTermsOrPrivacyScreenView(
                                          link: 'google.com',
                                        )),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/support.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Support page',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white.withOpacity(0.4),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 13, 8, 13),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/share.png'),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Share wth friends',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.white.withOpacity(0.4),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
                          child: Divider(
                            color: Colors.white.withOpacity(0.08),
                            height: 1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/sub.png'),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Subscription info',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.white.withOpacity(0.4),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const BottomBar()
      ]),
    );
  }
}
