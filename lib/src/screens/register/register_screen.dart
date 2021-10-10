import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_validator/string_validator.dart';

import '../../blocs/auth/register_bloc/register_bloc.dart';
import '../../helpers/string_helpers.dart';
import '../../models/user/user_credential.dart';
import '../../services/app_localization/app_localizations.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _userName = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  late StreamSubscription _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription =
        context.read<RegisterBloc>().stream.listen((RegisterState state) {});
  }

  @override
  void dispose() {
    super.dispose();
    _authSubscription.cancel();
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(AppLocalizations.of(context)!.register,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                          )),
                  const SizedBox(height: 16.0),
                  RoundedTextField(
                    autoFocus: true,
                    onSaved: (value) {
                      if (!StringHelper().isNullOrEmpty(value)) {
                        setState(() {
                          _userName = value!;
                        });
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _userName = value;
                      });
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
                        _onSubmited();
                      }
                    },
                    hintText: AppLocalizations.of(context)!.userNameHintText,
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
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
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
                        _onSubmited();
                      }
                    },
                    hintText: AppLocalizations.of(context)!.passwordHintText,
                  ),
                  const SizedBox(height: 16.0),
                  RoundedTextField(
                    onSaved: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value != _password) {
                        return 'Those Passwords Didn\'t Match.Try Again ';
                      }
                      return null;
                    },
                    hintText:
                        AppLocalizations.of(context)!.reEnterPasswordHintText,
                  ),
                  const SizedBox(height: 16.0),
                  RoundedButton(
                    height: 52.0,
                    minWidth: MediaQuery.of(context).size.width - 32,
                    text: AppLocalizations.of(context)!.register,
                    textStyle: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white),
                    backgroundColor: Colors.black,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _onSubmited();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _onSubmited() {
    // context.read<RegisterBloc>().add(RegisterCheckUserExisted(_userName));
    context.read<RegisterBloc>().add(RegisterAddNewUser(
        UserCredential(username: _userName, password: _password)));
  }
}
