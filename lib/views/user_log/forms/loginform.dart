// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_flutter_t4ulabs/controllers/user_log_controller.dart';
import '../../components/compoents.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUPInCtr());
    TextEditingController useremail = TextEditingController();
    TextEditingController userpass = TextEditingController();
    final formlogkey = GlobalKey<FormState>();
    return GetBuilder<SignUPInCtr>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: SvgPicture.asset('assets/Icons/login.svg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  'Log In To Acount',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              //margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  key: formlogkey,
                  child: Column(
                    children: [
                      entryField(
                          tapevent: () {},
                          isemail: true,
                          ispassword: false,
                          text: 'Email',
                          textcontroller: useremail,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Adresse Email non valide';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      entryField(
                          tapevent: () {
                            controller.switching();
                          },
                          issecure: controller.secure.value,
                          icon: controller.secure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          isemail: false,
                          ispassword: true,
                          text: 'password',
                          textcontroller: userpass,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Faible Password au moin 6 chiffre ';
                            } else {
                              return null;
                            }
                          }),
                    ],
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: costumButon(
                  context: context,
                  colorbtn: HexColor('#008080'),
                  text: 'Login',
                  hasicon: false,
                  myfunction: () {
                    if (formlogkey.currentState!.validate()) {
                      controller.signin(
                          context: context,
                          email: useremail.text,
                          pass: userpass.text);
                    } else {
                      print('error');
                    }
                  }),
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: const Divider(
                      color: Colors.white,
                      height: 50,
                    )),
              ),
              const Text(
                "OR",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: const Divider(
                      color: Colors.white,
                      height: 50,
                    )),
              ),
            ]),
            SizedBox(
              height: 60,
              child: costumButon(
                  context: context,
                  colorbtn: HexColor('#2F4F4F'),
                  text: 'Log In With Google',
                  hasicon: true,
                  myfunction: () {
                    print('taped');
                    controller.googlesginin(context: context);
                  }),
            ),
          ],
        ),
      );
    });
  }
}
