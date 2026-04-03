import 'package:flutter/material.dart';
import 'package:notium/common/boxes.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/common/constants.dart';
import 'package:notium/providers/app_lock_provider.dart';
import 'package:notium/providers/font_provider.dart';
import 'package:notium/theme/theme_provider.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FontProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        title: 'Settings',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appearance',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                    Switch(
                      overlayColor: overlayColor,
                      trackColor: trackColor,
                      value: Provider.of<ThemeProvider>(context).isDarkMode,
                      onChanged: (bool value) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Font Size',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: SegmentedButton<AppFontSize>(
                        style: SegmentedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          selectedForegroundColor: Colors.white,
                          selectedBackgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          visualDensity:
                              VisualDensity(horizontal: -2, vertical: -2),
                        ),
                        segments: const <ButtonSegment<AppFontSize>>[
                          ButtonSegment<AppFontSize>(
                            value: AppFontSize.small,
                            label: Text(
                              'Small',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          ButtonSegment<AppFontSize>(
                            value: AppFontSize.medium,
                            label: Text(
                              'Medium',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          ButtonSegment<AppFontSize>(
                            value: AppFontSize.large,
                            label: Text(
                              'Large',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                        selected: <AppFontSize>{provider.size},
                        onSelectionChanged: (Set<AppFontSize> newSelection) {
                          provider.setSize(newSelection.first);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enable App Lock',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                    Switch(
                      overlayColor: overlayColor,
                      trackColor: trackColor,
                      value: Provider.of<AppLockProvider>(context).isAppLocked,
                      onChanged: (bool value) {
                        Provider.of<AppLockProvider>(context, listen: false)
                            .toggleLock();
                      },
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Data',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Provider.of<ThemeProvider>(context).isDarkMode
                              ? Theme.of(context).colorScheme.inverseSurface
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: 12.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Import',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Provider.of<ThemeProvider>(context).isDarkMode
                              ? Theme.of(context).colorScheme.inverseSurface
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: 12.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Export',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Delete Everything',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Approve',
                                  ),
                                  onPressed: () async {
                                    Boxes.getNotes().clear();
                                    Boxes.getTrash().clear();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 12.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info),
                          SizedBox(width: 10.0),
                          Text('Version'),
                        ],
                      ),
                      Text(
                        '1.0.0',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse('https://notium.namanarora.xyz');

                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: ListTile(
                    title: Text('Privacy Policy'),
                    leading: Icon(Icons.privacy_tip),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri(
                      scheme: 'mailto',
                      path: '00517711623_ml@vipstc.edu.in',
                      query:
                          'subject=Contact%20Support&body=Hello%20Notium%20Team,',
                    );

                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: ListTile(
                    title: Text('Contact'),
                    leading: Icon(Icons.contact_phone),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
