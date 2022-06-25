// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_flutter_t4ulabs/views/user_log/forms/loginform.dart';
import '../../controllers/user_log_controller.dart';
import 'forms/Signupform.dart';

class SignUp_InScreen extends StatelessWidget {
  const SignUp_InScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUPInCtr());
    return GetBuilder<SignUPInCtr>(builder: (controller) {
      return Scaffold(
        backgroundColor: HexColor('#008B8B'),
        body: Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: TabBar(
                    indicatorColor: Colors.white,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    labelStyle: GoogleFonts.poppins(fontSize: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: controller.controller,
                    tabs: const [
                      Tab(
                        text: 'Log IN',
                      ),
                      Tab(
                        text: 'Sign Up',
                      ),
                    ])),
            Expanded(
              child: TabBarView(
                  physics: const ScrollPhysics(),
                  controller: controller.controller,
                  children: const [
                    LoginForm(),
                    SingInForm(),
                  ]),
            )
          ]),
        ),
      );
    });
  }
}
