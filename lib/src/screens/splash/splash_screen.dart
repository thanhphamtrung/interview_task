import 'package:flutter/material.dart';

import '../../constants/app_language.dart' as AppLanguage;
import '../../constants/global_constants.dart';
import '../../services/app_localization/app_localizations.dart';
import '../../widgets/rounded_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Spacer(flex: 307),
              Expanded(
                flex: 54,
                child: Image.asset('assets/images/app_logo.png'),
              ),
              const Spacer(flex: 340),
              Expanded(
                flex: 111,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/profile_icon.png'),
                          const SizedBox(width: 8.0),
                          Column(
                            children: [
                              Text(
                                AppLanguage.Splash.userName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                AppLanguage.Splash.userNameTag,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            height: 52.0,
                            width: MediaQuery.of(context).size.width / 2 - 21.0,
                            text: AppLocalizations.of(context)!.login,
                            textStyle: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.black),
                            backgroundColor: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, RouteName.login);
                            },
                          ),
                          const SizedBox(width: 12),
                          RoundedButton(
                            height: 52.0,
                            width: MediaQuery.of(context).size.width / 2 - 21.0,
                            text: AppLocalizations.of(context)!.register,
                            textStyle: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.white),
                            backgroundColor: Colors.black,
                            onPressed: () {
                              Navigator.pushNamed(context, RouteName.register);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
