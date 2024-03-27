import 'package:flutter/material.dart';

/// виджет лоадер поверх другиъ виджетов
class AppProgressIndicatorWidget extends StatefulWidget {
  const AppProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<AppProgressIndicatorWidget> createState() => _AppProgressIndicatorWidgetState();
}

class _AppProgressIndicatorWidgetState extends State<AppProgressIndicatorWidget>
    with TickerProviderStateMixin {
  // Create a controller
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();

  // Create an animation with value of type "double"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.grey.withOpacity(0.3),
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: RotationTransition(
            turns: _animation,
            child: const Icon(Icons.change_circle_outlined),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
