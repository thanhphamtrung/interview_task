import 'package:flutter/material.dart';

// ignore: library_prefixes
import '../../constants/app_language.dart' as AppLanguage;
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
              const Expanded(
                  flex: 54,
                  child:
                      Image(image: AssetImage('assets/images/app_logo.png'))),
              const Spacer(flex: 340),
              Expanded(
                flex: 111,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(
                              image:
                                  AssetImage('assets/images/profile_icon.png')),
                          const SizedBox(width: 8.0),
                          Column(
                            children: const [
                              Text(AppLanguage.Splash.userName),
                              Text(AppLanguage.Splash.userNameTag),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                          height: 52.0,
                          width: 167,
                          text: AppLanguage.Splash.login,
                          textStyle: const TextStyle(
                            fontSize: 13.0,
                          ),
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 12),
                        RoundedButton(
                          height: 52.0,
                          width: 167,
                          text: AppLanguage.Splash.register,
                          textStyle: const TextStyle(
                            fontSize: 13.0,
                          ),
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
