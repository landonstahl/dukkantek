import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../locator.dart';
import '../../../routing/navigationService.dart';
import '../../../routing/router.dart';
import '../../../widgets/loginSignup/animatedGradient.dart';

//Layout Template is a view that will embed other views inside of it. This allows us to have certain elements of the screen stay constant even while the user is
//navigating to other pages. Here it is used for the animated gradient and Veehive details in the login view. Because we are also using
class LayoutTemplateLogin extends StatelessWidget {
  const LayoutTemplateLogin({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        AnimatedGradient(),
        Center(
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
                      "VEEHIVE",
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
                  child: ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Center(
                        child: SizedBox(
                          width: 500,
                          child: Navigator(
                            key: locator<NavigationService>().navigatorKey,
                            onGenerateRoute: generateRoute,
                            initialRoute: 'login',
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
      ],
    );
  }
}

class LoginRoute {}
