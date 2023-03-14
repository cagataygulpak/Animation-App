// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animation_app/constant.dart';
import 'package:animation_app/deneme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  bool kontrol = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Deneme(
      animationController: animationController,
      kontrol: kontrol,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarMetodu(),
            pageViewLists(),
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person_outline_outlined),
                    title: Text("Öğrenci $index"),
                    trailing: index % 2 == 0
                        ? const Icon(Icons.smoking_rooms_outlined)
                        : null,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.cyan,
                    endIndent: 10,
                    indent: 10,
                  );
                },
                itemCount: 20),
          ],
        ),
      ),
    );
  }

  Widget pageViewLists() {
    return SizedBox(
      height: 200,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Lottie.asset(AnimasyonYolu.kus),
          Lottie.asset(AnimasyonYolu.penguen),
          Lottie.asset(AnimasyonYolu.papagan),
          Lottie.asset(AnimasyonYolu.party),
        ],
      ),
    );
  }

  AppBar appBarMetodu() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(Yazilar.baslik),
      actions: [
        const Icon(Icons.add),
      ],
      leading: InkWell(
        onTap: menuDegistir,
        child: const Icon(Icons.menu_outlined),
      ),
      leadingWidth: 50,
    );
  }
  void menuDegistir() => setState(() {
        kontrol ? animationController.forward() : animationController.reverse();
        kontrol = !kontrol;
      });
}
