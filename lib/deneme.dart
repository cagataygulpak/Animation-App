import 'package:animation_app/constant.dart';
import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  const Deneme({
    Key? key,
    required this.animationController,
    required this.body,
    required this.kontrol,
  }) : super(key: key);
  final AnimationController animationController;
  final Widget body;
  final bool kontrol;

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme>   {
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = widget.animationController;
    

    scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);

    slideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCubic));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            menuPage(),
            dashBoard(context),
          ],
        ),
      ),
    );
  }

  Widget dashBoard(BuildContext context) {
    // Material yerine Card yazsakta olur
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      top: widget.kontrol  ? 0.1 * MediaQuery.of(context).size.height : 0,
      bottom: widget.kontrol ? 0.1 * MediaQuery.of(context).size.height : 0,
      left: widget.kontrol  ? 0.5 * MediaQuery.of(context).size.width : 0,
      right: widget.kontrol  ? -0.4 * MediaQuery.of(context).size.width : 0,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          borderRadius: widget.kontrol 
              ? const BorderRadius.all(Radius.circular(40))
              : null,
          elevation: 50,
          shadowColor: Colors.green.shade300,
          child: widget.body,
        ),
      ),
    );
  }

  Widget menuPage() {
    return SlideTransition(
      position: slideAnimation,
      child: SafeArea(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.coffee_maker_outlined,
                      color: Renkler.mor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(Yazilar.dashboard),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: Renkler.mor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(Yazilar.messages),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_people_outlined,
                      color: Renkler.mor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(Yazilar.utilityBills),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.foundation_outlined,
                      color: Renkler.mor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(Yazilar.fundsTransfer),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: Renkler.mor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(Yazilar.branches),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
