import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/wrappers/wrapper_button.dart';
import 'package:movies_app/utils/palettes.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final bool showBadge;
  final Function onTap;

  const ButtonIcon({
    Key? key,
    required this.icon,
    this.showBadge = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WrapperButton(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Palettes.primary?.withOpacity(0.5),
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 22.0,
              ),
            ),
          ),
        ),
        showBadge != false
            ? Positioned(
                right: 5,
                top: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.amber,
                    width: 8,
                    height: 8,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
