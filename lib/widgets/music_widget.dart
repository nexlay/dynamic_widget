import 'package:flutter/material.dart';


class MusicWidget extends StatefulWidget {
  final Animation<double> opacity;
  final AnimationController controller;
  final Animation<Offset> animationOffset;
  final Animation<double> transition;
  final Animation<double> size;
  final Animation<double> opacityBtn;
  const MusicWidget({
    Key? key,
    required this.opacity,
    required this.controller,
    required this.animationOffset,
    required this.transition,
    required this.size,
    required this.opacityBtn,
  }) : super(key: key);

  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  Future<void> playAnimation() async {
    try {
      await widget.controller
          .forward()
          .orCancel;
    } on TickerCanceled {
      print(const TickerCanceled().ticker);
    }
  }

  Future<void> reverseAnimation() async {
    try {
      await widget.controller
          .reverse()
          .orCancel;
    } on TickerCanceled {
      print(const TickerCanceled().ticker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      SlideTransition(
        position: widget.animationOffset,
        child: RotationTransition(
          turns: widget.transition,
          child: Stack(
            children: [
              Visibility(
                visible: widget.controller.isCompleted ? false : true,
                child: CircleAvatar(
                  radius: widget.size.value,
                  backgroundColor: Colors.green,
                  backgroundImage: const ExactAssetImage('images/title.png'),
                ),
              ),
              Positioned(
                right: 0.0,
                top: 10.0,
                child: Opacity(
                  opacity: widget.opacityBtn.value,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        const CircleBorder(),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(16.0),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.lightGreen.shade100),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.favorite_border,
                        color: Colors.lightGreen),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 0.0,
                child: Opacity(
                  opacity: widget.opacityBtn.value,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        const CircleBorder(),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(22.0),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade100),
                    ),
                    onPressed: () {
                      if (widget.controller.value == 0) {
                        setState(() {
                          playAnimation();
                        });
                      } else {
                        setState(() {
                          reverseAnimation();
                        });
                      }
                    },
                    child: widget.controller.value > 0
                        ? const Icon(
                      Icons.pause,
                      color: Colors.blueAccent,
                      size: 32.0,
                    )
                        : const Icon(
                      Icons.play_arrow,
                      color: Colors.blueAccent,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
