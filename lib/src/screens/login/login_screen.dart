import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_validator/string_validator.dart';

import '../../blocs/auth/login_bloc/login_bloc.dart';
import '../../constants/global_constants.dart';
import '../../helpers/string_helpers.dart';
import '../../models/user/user_credential.dart';
import '../../services/app_localization/app_localizations.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late StreamSubscription _authSubscription;
  bool _showUnAuthentedMessage = false;

  @override
  void initState() {
    super.initState();
    _authSubscription =
        context.read<LoginBloc>().stream.listen((LoginState state) {
      if (state is LoginSuccess) {
        Navigator.of(context).pushReplacementNamed(RouteName.navigationScreen);
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      } else if (state is LoginFail) {
        setState(() {
          _showUnAuthentedMessage = true;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('LOGIN FAIL')));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _authSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String _userName = '';
    String _password = '';
    var _formKey = GlobalKey<FormState>();
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
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundedTextField(
                          autoFocus: true,
                          onSaved: (value) {
                            if (!StringHelper().isNullOrEmpty(value)) {
                              setState(() {
                                _userName = value!;
                              });
                            }
                          },
                          validator: (value) {
                            if (value == null ||
                                !(isAlphanumeric(value) || isEmail(value))) {
                              return AppLocalizations.of(context)!
                                  .userNameValidatorMessage;
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _onSubmited(_userName, _password);
                            }
                          },
                          hintText:
                              AppLocalizations.of(context)!.userNameHintText,
                        ),
                        const SizedBox(height: 16.0),
                        RoundedTextField(
                          obscureText: true,
                          onSaved: (value) {
                            if (!StringHelper().isNullOrEmpty(value)) {
                              setState(() {
                                _password = value!;
                              });
                            }
                          },
                          validator: (value) {
                            if (value == null || value.length < 5) {
                              return AppLocalizations.of(context)!
                                  .passwordValidatorMessage;
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _onSubmited(_userName, _password);
                            }
                          },
                          hintText:
                              AppLocalizations.of(context)!.passwordHintText,
                        ),
                        if (_showUnAuthentedMessage)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .userNameOrPasswordInValid,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                      ],
                    )),
                const SizedBox(height: 16.0),
                RoundedButton(
                  height: 52.0,
                  minWidth: MediaQuery.of(context).size.width,
                  text: AppLocalizations.of(context)!.login,
                  textStyle: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                  backgroundColor: Colors.black,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _onSubmited(_userName, _password);
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _onSubmited(String userName, String password) {
    var user = UserCredential(username: userName, password: password);
    BlocProvider.of<LoginBloc>(context).add(LoginUserChecked(user));
  }
}
