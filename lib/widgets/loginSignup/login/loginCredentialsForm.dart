import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../../viewmodels/loginSignup/loginViewModel.dart';
import '../InputTitle.dart';
import 'loginCredentialsEmailForm.dart';

class LoginCredentialsForm extends ViewModelWidget<LoginViewModel> {
  const LoginCredentialsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Form(
      key: model.loginCredentialFormKey,
      child: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Log in to your account",
                style: TextStyle(
                  // fontFamily: 'FjallaOne',
                  color: const Color(0xff292240),
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 24,
                    desktop: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                height: getValueForScreenType<double>(
                  context: context,
                  mobile: 350,
                  desktop: 350,
                ),
                width: 400,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginCredentialsEmailForm(),
                        const SizedBox(height: 10.0),
                        InputTitle(text: "Password"),
                        const SizedBox(height: 8),
                        Container(
                          height: 48,
                          child: TextFormField(
                            cursorColor: const Color(0xff6a6677),
                            decoration: InputDecoration(
                              suffix: GestureDetector(
                                onTap: model.togglePasswordView,
                                child: Icon(model.isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: model.passwordColor, width: 1.7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: model.passwordColorFocused,
                                    width: 1.7),
                              ),
                            ),
                            initialValue: model.tempPassword,
                            obscureText: model.isHidden,
                            onChanged: (String value) {
                              model.tempPassword = value;
                              model.resetPasswordColor();
                            },
                            onFieldSubmitted: (value) {
                              model.handleSubmit(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: (() => {
                                model.handleGoogleLogin(context),
                              }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                width: 30.0,
                                color: Colors.blue,
                              ),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30.0,
                        ),
                        Container(
                            height: 51,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: const Color(0xff471ef6),
                              onPressed: () async =>
                                  await model.handleSubmit(context),
                              child: const Text(
                                "Sign in",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
