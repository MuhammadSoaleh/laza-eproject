import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:laza/extensions/context_extension.dart';
import 'package:laza/intro_screen.dart';
import 'package:laza/theme.dart';
import 'package:provider/provider.dart';
import 'colors.dart';
import 'laza_icons.dart';
import 'package:laza/authservice.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
void logout() {
    final _auth = AuthServices();
    _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onTap: () => Scaffold.of(context).closeDrawer(),
                    child: Ink(
                      width: 45,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: context.theme.cardColor,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(LazaIcons.menu_vertical),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              maxRadius: 24,
                              child: Text('M'),
                            ),
                            const SizedBox(width: 10.0),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mrh Raju',
                                    style: context.bodyLargeW500,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: Text(
                                        'Verified Profile',
                                        style: context.bodySmall?.copyWith(color: ColorConstant.manatee),
                                      )),
                                      const SizedBox(width: 5.0),
                                      const Icon(
                                        LazaIcons.verified_badge,
                                        size: 15,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: context.theme.cardColor, borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          '3 Orders',
                          style: TextStyle(color: ColorConstant.manatee),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                Consumer<ThemeNotifier>(
                  builder: (context, themeNotifier, _) {
                    IconData iconData = Icons.brightness_auto;
                    switch (themeNotifier.themeMode) {
                      case ThemeMode.system:
                        iconData = Icons.brightness_auto_outlined;
                      case ThemeMode.light:
                        iconData = LazaIcons.sun;
                      case ThemeMode.dark:
                        iconData = Icons.dark_mode_outlined;
                    }
                    return ListTile(
                      leading: Icon(iconData),
                      onTap: () async {
                        await showModalActionSheet(
                            context: context,
                            title: 'Choose app appearance',
                            actions: <SheetAction<ThemeMode>>[
                              const SheetAction(label: 'Automatic (follow system)', key: ThemeMode.system),
                              const SheetAction(label: 'Light', key: ThemeMode.light),
                              const SheetAction(label: 'Dark', key: ThemeMode.dark),
                            ]).then((result) {
                          if (result == null) return;

                          themeNotifier.toggleTheme(result);
                        });
                      },
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                      title: const Text('Appearance'),
                      horizontalTitleGap: 10.0,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(LazaIcons.info_circle),
                  onTap: () {},
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Account Information'),
                  horizontalTitleGap: 10.0,
                ),
                ListTile(
                  leading: const Icon(LazaIcons.lock),
                  onTap: () {},
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Password'),
                  horizontalTitleGap: 10.0,
                ),
                ListTile(
                  leading: const Icon(LazaIcons.bag),
                  onTap: () {},
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Order'),
                  horizontalTitleGap: 10.0,
                ),
                ListTile(
                  leading: const Icon(LazaIcons.wallet),
                  onTap: () {},
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('My Cards'),
                  horizontalTitleGap: 10.0,
                ),
                ListTile(
                  leading: const Icon(LazaIcons.heart),
                  onTap: () {},
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Whislist'),
                  horizontalTitleGap: 10.0,
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  onTap: () {

                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Settings'),
                  horizontalTitleGap: 10.0,
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(LazaIcons.logout, color: Colors.red),
                  title: const Text('LOGOUT'),
                  onTap: logout,
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
