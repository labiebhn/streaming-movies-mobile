import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/utils/palettes.dart';

class BadgeTag extends StatelessWidget {
  final String title;
  const BadgeTag({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 12.0,
        ),
        color: Palettes.primary?.withOpacity(0.5),
        child: Text(
          title,
          style: Fonts.p,
        ),
      ),
    );
  }
}
