import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/utils/palettes.dart';

class WrapperSafeArea extends StatelessWidget {
  final Widget child;
  const WrapperSafeArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Palettes.background,
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Container(
            width: width,
            color: Palettes.background,
            child: child,
          ),
        ),
      ),
    );
  }
}
