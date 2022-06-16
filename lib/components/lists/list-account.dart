import 'package:flutter/material.dart';
import 'package:movies_app/components/buttons/button-icon.dart';
import 'package:movies_app/constans/const_images.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/utils/palettes.dart';

class ListAccount extends StatelessWidget {
  const ListAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Palettes.background,
                      child: Image.asset(
                        ConstImages.ImgUser,
                        width: 42,
                        height: 42,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Hello,',
                      style: Fonts.p,
                    ),
                    Text(
                      'John Doe',
                      style: Fonts.h5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonIcon(
            icon: Icons.notifications_none,
            showBadge: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
