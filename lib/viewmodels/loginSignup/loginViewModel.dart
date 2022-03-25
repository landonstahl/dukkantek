import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dukkantek/routing/routeNames.dart';

import '../../datamodels/auth/loginModel.dart';
import '../../locator.dart';
import '../../routing/navigationService.dart';
import '../../services/auth/loginApi.dart';

class LoginViewModel extends ChangeNotifier {
  late LoginModel loginResponse;
  //Instantiating variables, all variables should be held in the viewmodel

  String username = "";
  String password = "";
  String tempUsername = "";
  String tempPassword = "";

  //All colors can be changed by the viewmodel, we use this to send color cues alongside snackbar messages

  Color usernameColor = Colors.grey;
  Color passwordColor = Colors.grey;

  Color usernameColorFocused = const Color(0xff471ef6);
  Color passwordColorFocused = const Color(0xff471ef6);

  bool isHidden = true;
  bool rememberPassword = false;
  late bool usernameValid, passwordValid;

  GlobalKey<FormState> loginCredentialFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginCredentialsEmailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginCredentialsPhoneFormKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();

  final _api = locator<LoginApi>();

  void resetUsernameColor() {
    usernameColor = Colors.grey;
    usernameColorFocused = const Color(0xff471ef6);
    notifyListeners();
  }

  void resetPasswordColor() {
    passwordColor = Colors.grey;
    passwordColorFocused = const Color(0xff471ef6);
    notifyListeners();
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    notifyListeners();
  }

  void toggleRemberPassword(bool newValue) {
    rememberPassword = !rememberPassword;
    notifyListeners();
  }

  void usernameError() {
    usernameColor = Colors.red;
    usernameColorFocused = Colors.red;
  }

  void passwordError() {
    passwordColor = Colors.red;
    passwordColorFocused = Colors.red;
  }

  void showInSnackBar(String value, BuildContext context) {
    loginScaffoldKey.currentState?.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Text(value),
      ),
    );
  }

  void showAlert(context) {
    if (usernameColor == Colors.red || passwordColor == Colors.red) {
      showInSnackBar("The highlighted fields are required", context);
    } else {}
  }

  handleSubmit(BuildContext context) {
    handleRegisterWithEmail(context);
  }

  void handleRegisterWithEmail(BuildContext context) {
    username = tempUsername;
    password = tempPassword;

    if (username == null) {
      usernameError();
    }
    if (password == null) {
      passwordError();
    } else {
      checkValidationUsername(context);
    }
    showAlert(context);
    notifyListeners();
  }

  Future<void> checkValidationUsername(BuildContext context) async {
    if (username.isEmpty) {
      usernameError();
    }
    if (password.isEmpty) {
      passwordError();
    }
    sendLoginRequest(context);
    notifyListeners();
  }

  Future<void> sendLoginRequest(BuildContext context) async {
    loginResponse = await _api.loginApi(context, username, password);
    if (loginResponse.httpCode == 200) {
      locator.get<NavigationService>().navigateTo(PlaceholderRoute);
    } else {
      showInSnackBar(loginResponse.message, context);
    }
  }

  // handle google login pushed
  Future<void> handleGoogleLogin(BuildContext context) async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
  }
}
