import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_flutter_t4ulabs/views/components/compoents.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final VideoPlayerController controller = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/fluttertest-3f83a.appspot.com/o/videos%2Fexample3.mp4?alt=media&token=334080df-8cb5-4437-86cb-c6b3bcde749a');

  @override
  Widget build(BuildContext context) {
    controller.initialize();
    controller.setLooping(true);
    controller.setVolume(1);
    controller.play();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        //margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.all(2),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: HexColor('#4B0082'),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(70))),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(70))),
                      child: const CircleAvatar(
                        maxRadius: 60,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset('assets/Icons/Search.svg'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Container(
                    child: feeds(
                        childvd: SizedBox(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      ),
                    )),
                  );
                }),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 25),
          ],
        ),
      ),
    );
  }
}
