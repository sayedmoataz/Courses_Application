// ignore_for_file: non_constant_identifier_names, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/Notification_Screen.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/about_us_screen.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/contact_us_screen.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/languages_screen.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/my_favorite_screen.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/my_wallet_screen.dart';
import 'package:new_version_15_march/Modules/Menu_Screens/privacy_screen.dart';
import 'package:new_version_15_march/Modules/Settings/Setting_Screen.dart';
import 'package:new_version_15_march/Shared/UI/Drawer/bottom_user_info.dart';
import 'package:new_version_15_march/Shared/UI/Drawer/custom_list_tile.dart';
import 'package:new_version_15_march/Shared/UI/Drawer/header.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromRGBO(20, 20, 20, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.grey,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.favorite,
                title: 'My Favouirte',
                infoCount: 0,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavoriteScreen()),
                  );
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.payment,
                title: 'My Wallet',
                infoCount: 0,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWalletScreen()),
                  );
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.language,
                title: 'Language',
                infoCount: 0,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguagesScreen()),
                  );
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.privacy_tip,
                title: 'Privacy',
                infoCount: 8,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyScreen()),
                  );
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.message,
                title: 'Contact Us',
                infoCount: 0,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsScreen()),
                  );
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.info,
                title: 'About',
                infoCount: 0,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()),
                  );
                },
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.notifications,
                title: 'Notifications',
                infoCount: 2,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()),
                  );
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.settings,
                title: 'Settings',
                infoCount: 0,
                OnTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              BottomUserInfo(isCollapsed: _isCollapsed),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
