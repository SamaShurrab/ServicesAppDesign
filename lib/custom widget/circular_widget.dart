import 'package:flutter/widgets.dart';

class CircularWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget widget;
  final Color? color;
  const CircularWidget({
    super.key,
    required this.height,
    required this.width,
    required this.widget,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: widget,
    );
  }
}
