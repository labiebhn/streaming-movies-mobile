import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/utils/fonts.dart';

class InputTextSearch extends StatefulWidget {
  final void Function(String) onChanged;
  final TextEditingController controller;
  const InputTextSearch(
      {Key? key, required this.onChanged, required this.controller})
      : super(key: key);

  @override
  State<InputTextSearch> createState() => _InputTextSearchState();
}

class _InputTextSearchState extends State<InputTextSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
          Flexible(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Movies',
              ),
              textInputAction: TextInputAction.search,
              style: Fonts.h5,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
