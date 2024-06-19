import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/core/widgets/contact_us_text_button.dart';
import 'package:step_forward/core/widgets/custom_button.dart';
import 'package:step_forward/futures/auth/presentation/views/sign_in_view.dart';
import 'package:step_forward/futures/auth/presentation/views/sign_up_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      getUserName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(AssetsData.kLogo),
            ),
            const SizedBox(height: 20),
            const Text(
              'Step Forward',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (_userEmail != null)
              Card(
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(_userEmail ?? 'No Email',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
              ),
            const SizedBox(height: 20),
            const ContactUsTextButton(),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Sign Out',
              onPressed: () async {
                await signOutFromApp();

                Get.offAll(() => const SignInView());
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Delete Account',
              onPressed: () async {
                await deleteAccount();

                Get.offAll(() => const SignUpView());
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  getUserName() {
    setState(() {});
    _userEmail = FirebaseAuth.instance.currentUser!.email;
  }

  signOutFromApp() async {
    await FirebaseAuth.instance.signOut();
  }

  deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  // Future<void> _launchUrl({
  //   required String url,
  // }) async {
  //   final Uri uri = Uri.parse(url);
  //   EmailAuthProvider.provider.launchUrl(uri);
  //   if (!await launchUrl(uri)) {
  //     throw Exception('Could not launch $uri');
  //   }
  // }
}
