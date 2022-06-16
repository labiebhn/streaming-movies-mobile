import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';
import 'package:movies_app/utils/fonts.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperSafeArea(
        child: Container(
          child: const Center(
            child: Icon(
              Icons.construction,
              size: 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
