import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget entryField(
    {required String text,
    required bool ispassword,
    required bool isemail,
    bool issecure = true,
    IconData icon = Icons.visibility,
    required TextEditingController textcontroller,
    required VoidCallback tapevent,
    Color textcolor = Colors.white,
    required FormFieldValidator<String> validator}) {
  return TextFormField(
    controller: textcontroller,
    obscureText: issecure,
    validator: validator,
    keyboardType: isemail ? TextInputType.emailAddress : TextInputType.text,
    style: TextStyle(
      fontSize: 18,
      color: textcolor,
    ),
    decoration: InputDecoration(
        suffixIcon: ispassword
            ? IconButton(
                icon: Icon(icon),
                onPressed: tapevent,
              )
            : null,
        labelText: text,
        labelStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
        floatingLabelStyle: TextStyle(color: textcolor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8),
        )),
  );
}

Widget costumButon(
        {required BuildContext context,
        required Color colorbtn,
        required String text,
        required bool hasicon,
        required VoidCallback myfunction}) =>
    Material(
      elevation: 5.0,
      //borderRadius: BorderRadius.circular(30.0),
      color: colorbtn,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: myfunction,
        child: hasicon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      FontAwesomeIcons.google,
                      color: Color.fromARGB(255, 242, 242, 242),
                      size: 16,
                    ),
                  ),
                  Text(text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              )
            : Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

Widget feeds({
  required Widget childvd,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    width: double.infinity,
    height: 400,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(70))),
                  child: const CircleAvatar(
                    radius: 25,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Hamdi Chalbi',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Video Title',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Row(mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.grey[200],
                          child: SvgPicture.asset('assets/Icons/Star.svg')),
                      CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 10,
                          child: SvgPicture.asset('assets/Icons/Star.svg')),
                    ]),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Text(
            'Le lorem ipsum est, en imprimerie, une suite de mots sans signification',
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w200),
          ),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            /*image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Icons/cptest.JPG'))*/
          ),
          child: childvd,
        )),
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            bottom: 10,
          ),
          child: Text(
            'Video Title',
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 15, bottom: 15),
            child: Row(mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey[200],
                      child: SvgPicture.asset('assets/Icons/Like.svg')),
                  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 15,
                      child: SvgPicture.asset('assets/Icons/Comment.svg')),
                  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 15,
                      child: SvgPicture.asset('assets/Icons/share.svg')),
                ]),
          ),
        )
      ],
    ),
  );
}
