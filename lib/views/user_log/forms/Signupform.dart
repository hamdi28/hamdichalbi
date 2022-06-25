// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../controllers/user_log_controller.dart';
import '../../components/compoents.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingInForm extends StatelessWidget {
  const SingInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUPInCtr());
    TextEditingController userfullname = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController useremail = TextEditingController();
    TextEditingController userpass = TextEditingController();
    TextEditingController userconfirmpass = TextEditingController();
    final formlogkeyup = GlobalKey<FormState>();
    return GetBuilder<SignUPInCtr>(builder: ((controller) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: SvgPicture.asset('assets/Icons/signup.svg'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  'Create Acount',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              //margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  key: formlogkeyup,
                  child: Column(
                    children: [
                      entryField(
                          tapevent: () {},
                          isemail: false,
                          ispassword: false,
                          text: 'FirstName',
                          textcontroller: userfullname,
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 2) {
                              return 'Enter un Nom valide';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      entryField(
                          tapevent: () {},
                          isemail: false,
                          ispassword: false,
                          text: 'Name',
                          textcontroller: username,
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 2) {
                              return 'Enter un Nom valide';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
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
                        height: 10,
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
                      const SizedBox(
                        height: 10,
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
                          text: 'Confirem password',
                          textcontroller: userconfirmpass,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length < 6 ||
                                userpass.text != userconfirmpass.text) {
                              return 'password doesn\'t match';
                            } else {
                              return null;
                            }
                          }),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: controller.cheked.value,
                      onChanged: (tap) {
                        tap == true
                            ? controller.tearms(true)
                            : controller.tearms(false);
                        print(controller.cheked.value);
                      },
                      activeColor: Colors.transparent,
                    ),
                    Text(
                      'I agree Conditions and Tearms',
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: costumButon(
                  context: context,
                  colorbtn: HexColor('#008080'),
                  text: 'Save',
                  hasicon: false,
                  myfunction: () {
                    if (formlogkeyup.currentState!.validate() ||
                        controller.cheked.value == true) {
                      print('good');
                    } else {
                      print('error');
                    }
                  }),
            ),
          ],
        ),
      );
    }));
  }
}
