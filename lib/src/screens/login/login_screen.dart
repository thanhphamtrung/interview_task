import 'package:flutter/material.dart';
import 'package:interview_task/src/widgets/rounded_button.dart';

import '../../services/app_localization/app_localizations.dart';
import '../../widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/images/backbutton.png'),
            color: Colors.black,
            iconSize: 12.0,
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Text(AppLocalizations.of(context)!.login,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                        )),
                const SizedBox(height: 16.0),
                RoundedTextField(
                  autoFocus: true,
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.userNameHintText,
                ),
                const SizedBox(height: 16.0),
                RoundedTextField(
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.passwordHintText,
                ),
                const SizedBox(height: 16.0),
                RoundedButton(
                  height: 52.0,
                  text: AppLocalizations.of(context)!.login,
                  textStyle: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                  backgroundColor: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
