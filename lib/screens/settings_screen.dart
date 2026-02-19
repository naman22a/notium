import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/theme/theme.dart';
import 'package:notium/theme/theme_provider.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

enum FontSize { small, medium, large }

enum AutoLock { thirtySeconds, oneMinute, fiveMinutes }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  FontSize fontSizeView = FontSize.medium;
  AutoLock? _autoLock = AutoLock.oneMinute;

  @override
  Widget build(BuildContext context) {
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
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dark Mode'),
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
                    Text('Font Size'),
                    SizedBox(
                      width: 300.0,
                      child: SegmentedButton<FontSize>(
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
                        segments: const <ButtonSegment<FontSize>>[
                          ButtonSegment<FontSize>(
                            value: FontSize.small,
                            label: Text(
                              'Small',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          ButtonSegment<FontSize>(
                            value: FontSize.medium,
                            label: Text(
                              'Medium',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          ButtonSegment<FontSize>(
                            value: FontSize.large,
                            label: Text(
                              'Large',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                        selected: <FontSize>{fontSizeView},
                        onSelectionChanged: (Set<FontSize> newSelection) {
                          setState(() {
                            fontSizeView = newSelection.first;
                          });
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
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enable App Lock'),
                    Row(
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(primaryColor),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Biometric',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(primaryColor),
                          ),
                          onPressed: () {},
                          child: Text(
                            'PIN',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text('Auto Lock After'),
                RadioGroup(
                  groupValue: _autoLock,
                  onChanged: (AutoLock? value) {
                    setState(() {
                      _autoLock = value;
                    });
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('30 Secs'),
                        leading: Radio<AutoLock>(
                          value: AutoLock.thirtySeconds,
                          fillColor: WidgetStatePropertyAll(primaryColor),
                        ),
                      ),
                      ListTile(
                        title: const Text('1 Minute'),
                        leading: Radio<AutoLock>(
                          value: AutoLock.oneMinute,
                          fillColor: WidgetStatePropertyAll(primaryColor),
                        ),
                      ),
                      ListTile(
                        title: const Text('5 Minutes'),
                        leading: Radio<AutoLock>(
                          value: AutoLock.fiveMinutes,
                          fillColor: WidgetStatePropertyAll(primaryColor),
                        ),
                      ),
                    ],
                  ),
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
                        foregroundColor: WidgetStatePropertyAll(primaryColor),
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
                        foregroundColor: WidgetStatePropertyAll(primaryColor),
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
                      onPressed: () {},
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
                ListTile(
                  title: Text('Privacy Policy'),
                  leading: Icon(Icons.privacy_tip),
                ),
                ListTile(
                  title: Text('Contact'),
                  leading: Icon(Icons.contact_phone),
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
