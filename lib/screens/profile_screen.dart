import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../widgets/stats_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String appVersion = '1.0.0'; // Default value
  String platformInfo = 'Unknown Platform'; // Default value
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAppAndDeviceInfo();
  }

  Future<void> _loadAppAndDeviceInfo() async {
    try {
      // Load app version first
      final packageInfo = await PackageInfo.fromPlatform();

      // Then load device info
      final deviceInfo = DeviceInfoPlugin();
      String platformString = 'Unknown Platform';

      if (Theme.of(context).platform == TargetPlatform.iOS) {
        final iosInfo = await deviceInfo.iosInfo;
        platformString = 'iOS ${iosInfo.systemVersion}';
      } else if (Theme.of(context).platform == TargetPlatform.android) {
        final androidInfo = await deviceInfo.androidInfo;
        platformString = 'Android ${androidInfo.version.release}';
      }

      if (mounted) {
        setState(() {
          appVersion = 'v${packageInfo.version} (${packageInfo.buildNumber})';
          platformInfo = platformString;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          appVersion = 'v1.0.0';
          platformInfo = 'Device Info Unavailable';
          isLoading = false;
        });
      }
      debugPrint('Error loading device info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://picsum.photos/250?image=9',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Qambar Abbas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 16,
                color: CupertinoColors.inactiveGray,
              ),
            ),
            const SizedBox(height: 24),
            _buildStatsRow(),
            const SizedBox(height: 32),
            _buildProfileInfoRow('Email', 'qambar@example.com'),
            const SizedBox(height: 12),
            _buildProfileInfoRow('Joined', 'August 2025'),
            const SizedBox(height: 12),
            _buildProfileInfoRow('Location', 'Delhi, India'),
            const SizedBox(height: 32),
            CupertinoButton.filled(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: const Text('Edit Profile'),
              onPressed: () {
                // Navigate to Edit Profile Screen
              },
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              child: const Text(
                'Logout',
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),
              onPressed: () {
                // Handle logout
              },
            ),
            const SizedBox(height: 32),
            // App version and platform info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Text(
                    appVersion,
                    style: TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  isLoading
                      ? const CupertinoActivityIndicator(radius: 8)
                      : Text(
                          platformInfo,
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.systemGrey.withOpacity(0.7),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        StatsCard(
          title: 'Tests Taken',
          value: '12',
          icon: CupertinoIcons.doc_text,
          color: CupertinoColors.activeBlue,
        ),
        StatsCard(
          title: 'Avg. Score',
          value: '78%',
          icon: CupertinoIcons.chart_bar_alt_fill,
          color: CupertinoColors.systemOrange,
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: CupertinoColors.systemGrey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
