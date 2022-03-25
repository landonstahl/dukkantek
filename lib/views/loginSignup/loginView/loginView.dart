import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../viewmodels/loginSignup/loginViewModel.dart';
import '../../../widgets/loginSignup/animatedGradient.dart';
import '../../../widgets/loginSignup/login/loginCredentialsForm.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        key: model.loginScaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            alignment: const Alignment(0.6, 0.6),
            children: [
              Container(
                child: AnimatedGradient(),
              ),
              Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: SelectableText(
                              "Dukkantek",
                              style: TextStyle(
                                  // fontFamily: 'FjallaOne',
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: 600,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 20,
                          child: const ClipRRect(
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Center(
                                child: SizedBox(
                                  width: 500,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30),
                                      child: LoginCredentialsForm(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black38, Colors.transparent],
                          ),
                        ),
                      ),
                    ],
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
