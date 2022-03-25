import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../viewmodels/loginSignup/loginViewModel.dart';
import '../InputTitle.dart';

class LoginCredentialsEmailForm extends ViewModelWidget<LoginViewModel> {
  const LoginCredentialsEmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Form(
      key: model.loginCredentialsEmailFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InputTitle(text: "Email or Username"),
          const SizedBox(height: 8),
          SizedBox(
            height: 48,
            child: TextFormField(
              cursorColor: const Color(0xff6a6677),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: model.usernameColor, width: 1.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: model.usernameColorFocused, width: 1.7),
                ),
              ),
              keyboardType: TextInputType.text,
              initialValue: model.tempUsername,
              onChanged: (String value) {
                model.tempUsername = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
