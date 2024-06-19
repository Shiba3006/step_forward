import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:step_forward/core/utils/app_colors.dart';

class ContactUsTextButton extends StatelessWidget {
  const ContactUsTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contact us: ',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () async {
            final Email email = Email(
              body: 'From Step Forward app',
              subject: 'From Step Forward app',
              recipients: ['just.shiba3006@gmail.com'],
              isHTML: false,
            );
            await FlutterEmailSender.send(email);
          },
          child: Text(
            'just.shiba3006@gmail.com',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
