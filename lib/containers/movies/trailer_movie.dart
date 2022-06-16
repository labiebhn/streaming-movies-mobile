import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/players/trailer_video_player.dart';
import 'package:movies_app/utils/fonts.dart';

class TrailerMovie extends StatefulWidget {
  const TrailerMovie({Key? key}) : super(key: key);

  @override
  State<TrailerMovie> createState() => _TrailerMovieState();
}

class _TrailerMovieState extends State<TrailerMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: const Text(
              'Trailer',
              style: Fonts.h5,
            ),
          ),
          TrailerVideoPlayer(),
        ],
      ),
    );
  }
}
