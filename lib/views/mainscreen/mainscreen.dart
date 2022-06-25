import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_t4ulabs/controllers/main_controller.dart';

class MainScreeen extends StatelessWidget {
  const MainScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainCtr());
    return GetBuilder<MainCtr>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Container(
              child: SvgPicture.asset('assets/Icons/HomeBlackcolor.svg'),
            ),
            Container(
              child: SvgPicture.asset('assets/Icons/Block.svg'),
            ),
            Container(
              child: SvgPicture.asset('assets/Icons/Plus.svg'),
            ),
            Container(
              child: SvgPicture.asset('assets/Icons/Block.svg'),
            ),
            Container(
              child: SvgPicture.asset('assets/Icons/Block.svg'),
            ),
          ],
          onTap: (index) {
            controller.switchview(index);
          },
        ),
        body: controller.mainbody[controller.page.value],
      );
    });
  }
}
