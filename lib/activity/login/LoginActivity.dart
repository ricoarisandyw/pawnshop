import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/BaseForm.dart';
import 'package:flutter_app/activity/base/BaseState.dart';
import 'package:flutter_app/activity/base/Buttons.dart';
import 'package:flutter_app/activity/menu/MenuActivity.dart';
import 'package:flutter_app/activity/menu_staff/MenuStaffActivity.dart';
import 'package:flutter_app/service/PermissionService.dart';

class LoginActivity extends StatefulWidget {
  LoginActivity(){
    PermissionService().askPermission();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}

class _LoginPage extends BaseState<LoginActivity> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.setContext(context);
    // TODO: implement build
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(
            builder: (scaffold_context) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/jewel_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(30),
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/gem_2.png"),
                    ),
                    Text(
                      "Pawnshop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Playfair'),
                    ),
                    Text(
                      "Pawnshop management become easier",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    BaseForm(
                      hintText: "Username",
                      icon: Icons.person_pin,
                      controller: username_controller,
                    ),
                    BaseForm(
                      hintText: "Password",
                      icon: Icons.vpn_key,
                      obscure: true,
                      controller: password_controller,
                    ),
                    PrimaryButton(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (password_controller.text == "1234") {
                          if (username_controller.text == "admin") {
                            goto(MenuActivity());
                          } else if (username_controller.text == "staff") {
                            goto(MenuStaffActivity());
                          } else {
                            Scaffold.of(scaffold_context)
                                .showSnackBar(new SnackBar(
                              content: new Text(
                                "Sorry :(\nyour username/password is wrong",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        } else {
                          Scaffold.of(scaffold_context).showSnackBar(
                            new SnackBar(
                              content: new Text(
                                "Sorry :(\nyour username/password is wrong",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
