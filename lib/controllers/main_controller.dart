import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_t4ulabs/views/mainscreen/addvideo_screen.dart';
import 'package:test_flutter_t4ulabs/views/mainscreen/homescreen.dart';

class MainCtr extends GetxController {
  List<Widget> mainbody = [
    HomeScreen(),
    Container(),
    const AddVideoScreen(),
    Container(),
    Container(),
  ];
  var page = 0.obs;

  switchview(int index) {
    page.value = index;
    update();
  }
}
