import 'package:flutter/material.dart';

import '../../constants/app_language.dart' as AppLanguage;
import '../../services/app_localization/app_localizations.dart';

class WhatNew extends StatelessWidget {
  const WhatNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        AppLocalizations.of(context)!.whatNew,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontWeight: FontWeight.w900),
      ),
      const SizedBox(height: 24.0),
      Image.asset(
        'assets/images/what_new.png',
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
      const SizedBox(height: 16.0),
      Row(
        children: [
          Image.asset('assets/images/what_new_profile.png'),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLanguage.Home.userName,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                AppLanguage.Home.userNameTag,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
