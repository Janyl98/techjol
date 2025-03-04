import 'package:easy_localization/easy_localization.dart';

import 'package:ecommerce_app_api/core/extensions/context_extension.dart';
import 'package:ecommerce_app_api/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, required this.translationKey}) : super(key: key);
  final String translationKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            translationKey.tr().toTitleCase(),
            style: context.textTheme.headlineMedium!.copyWith(
              color: context.colors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
