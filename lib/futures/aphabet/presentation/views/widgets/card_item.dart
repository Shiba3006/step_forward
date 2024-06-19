import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/core/utils/app_styles.dart';
import 'package:step_forward/core/utils/constants.dart';

import 'package:step_forward/futures/aphabet/data/models/card_item_model.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.cardItemModel,
  });
  final CardItemModel cardItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(cardItemModel.widget,
            transition: Transition.circularReveal,
            duration: kTransationDuration);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 5),
              ),
            ],
            color: Colors.white,
            // const Color.fromARGB(255, 255, 233, 226),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cardItemModel.title,
                textAlign: TextAlign.center,
                style: Styles.styleCard,
              ),
              const SizedBox(
                height: 10,
              ),
              Icon(
                cardItemModel.icon,
                size: 40,
                color: AppColors.kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
