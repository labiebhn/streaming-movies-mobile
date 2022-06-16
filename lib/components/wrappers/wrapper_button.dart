import 'package:flutter/material.dart';

class WrapperButton extends StatefulWidget {
  final Function onTap;
  final Widget child;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;

  const WrapperButton({Key? key, required this.onTap, required this.child}) : super(key: key);

  @override
  State<WrapperButton> createState() => _WrapperButtonState();
}

class _WrapperButtonState extends State<WrapperButton> {
  late bool isDown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap(),
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
        child: widget.child,
      ),
    );
  }
}