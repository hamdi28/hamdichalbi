import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/compoents.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titlevideo = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Upload Video',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w500),
        ),
        //centerTitle: true,
        elevation: 0.8,
        leadingWidth: 30,
        leading: GestureDetector(
          child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset('assets/Icons/Back.svg')),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Text(
                'Titel Video',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'video Title',
                  fillColor: Colors.grey[300],
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 207, 198, 198))),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 207, 198, 198))),
                  enabledBorder: const OutlineInputBorder()),
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'Video Description',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: TextFormField(
              minLines: 2,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText:
                      'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page',
                  fillColor: Colors.grey[300],
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 207, 198, 198))),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 207, 198, 198))),
                  enabledBorder: const OutlineInputBorder()),
            )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return const Color.fromARGB(255, 22, 110, 209);
                              // Use the component's default.
                            },
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'parcourir',
                          maxLines: 1,
                        )),
                  )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        // controller: filecontroller,
                        decoration: const InputDecoration(
                          //label: Text(nom.toString()),
                          enabled: false,
                          hintText: 'Video mp4.,,',
                          alignLabelWithHint: true,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: costumButon(
                  context: context,
                  colorbtn: HexColor('#2F4F4F'),
                  text: 'Upload',
                  hasicon: false,
                  myfunction: () {}),
            )
          ],
        ),
      ),
    );
  }
}
