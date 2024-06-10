import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokoto/widgets/loading_dialog.dart';

import '../service/user_service.dart';
import '../util/token.dart';
import '../util/ucolor.dart';
import 'bottom_nav.dart';
import 'help_center_view.dart';
import 'my_account_view.dart';
import 'notification_view.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 38,
                child: Icon(
                  Icons.person_outline,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyAccountView();
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: UColor.primary,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "My Account",
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NotificationView();
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: UColor.primary,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Notification",
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: UColor.primary,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Settings",
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HelpCenterView();
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: UColor.primary,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Help Center",
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => const LoadingDialog(),
                );

                await UserService().logout().then((value) {
                  token = null;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNav(),
                      ),
                      (route) => false);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: UColor.primary,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Log Out",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
