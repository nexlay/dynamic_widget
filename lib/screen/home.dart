import 'package:dynamic_widget/widgets/music_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/dynamic_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);

  late final Animation<double> size = Tween<double>(
    begin: 90.0,
    end: 20.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.000,
        0.400,
        curve: Curves.ease,
      ),
    ),
  );

  late final Animation<double> opacityBtn =
      Tween<double>(begin: 1.0, end: 0.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.100, 0.300),
    ),
  );

  late final Animation<Offset> animationOffset = Tween<Offset>(
    begin: const Offset(-0.4, -1.1),
    end: const Offset(-1.50, -18.4),
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.300, 0.500, curve: Curves.linear),
    ),
  );
  late final Animation<double> opacity =
      Tween<double>(begin: 0.0, end: 0.9).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 0.6),
    ),
  );

  late Animation<double> transition = CurvedAnimation(
    parent: controller,
    curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
            ),
          ),
          child: AnimatedBuilder(
            animation: controller,
            builder: _buildAnimation,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Opacity(
          opacity: opacity.value,
          child: Center(
            child: DynamicWidget(
              controller: controller,
            ),
          ),
        ),
        MusicWidget(
          opacity: opacity,
          controller: controller,
          animationOffset: animationOffset,
          transition: transition,
          size: size,
          opacityBtn: opacityBtn,
        ),
      ]),
    );
  }
}
