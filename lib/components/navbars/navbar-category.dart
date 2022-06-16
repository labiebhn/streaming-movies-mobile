import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/navbars/config.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/utils/palettes.dart';

class NavbarCategory extends StatefulWidget {
  const NavbarCategory({Key? key}) : super(key: key);

  @override
  State<NavbarCategory> createState() => _NavbarCategoryState();
}

class _NavbarCategoryState extends State<NavbarCategory> {
  Map active = {
    'key': navCategories[0]['key'],
    'name': navCategories[0]['name'],
  };

  void onNavChange(item) {
    setState(() {
      active = item;
    });
  }

  ButtonStyle navStyle(item) {
    if (active['key'] == item['key']) {
      return TextButton.styleFrom(
        primary: Colors.red[600],
      );
    } else {
      return TextButton.styleFrom(
        primary: Palettes.textDisabled,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...navCategories.map(
          (item) => TextButton(
            onPressed: () => onNavChange(item),
            style: navStyle(item),
            child: Text(
              item['name'],
              style: Fonts.p,
            ),
          ),
        ),
      ],
    );
  }
}
