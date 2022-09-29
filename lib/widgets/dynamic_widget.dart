import 'package:flutter/material.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'dart:math' as math;

class DynamicWidget extends StatefulWidget {
  final AnimationController controller;
  const DynamicWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  final List<int> duration = [900, 700, 600, 800, 500];
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: AnimatedContainer(
            height: selected ? 170 : 50.0,
            width: selected ? 300 : 179.0,
            decoration: BoxDecoration(
                image: selected
                    ? const DecorationImage(
                        image: AssetImage('images/title.png'),
                        fit: BoxFit.cover,
                        opacity: 0.3)
                    : null,
                borderRadius: const BorderRadius.all(
                  Radius.circular(26.0),
                ),
                color: Colors.black),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: Wrap(
                children: [
                  AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 100),
                    height: selected ? 70 : 0.0,
                    width: selected ? 300 : 0.0,
                    child: const ListTile(
                      title: Text(
                        'Root to branch',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      subtitle: Text(
                        'volume 4',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      Expanded(
                        child: AnimatedSize(
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 500),
                          child: CircleAvatar(
                            radius: selected ? 30.0 : 20.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                const ExactAssetImage('images/title.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: selected ? true : false,
                          child: Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: MusicVisualizer(
                          barCount: 10,
                          colors: colors,
                          duration: duration,
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: selected ? true : false,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              widget.controller.reverse().orCancel;
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
