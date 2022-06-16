import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/components/players/fullscreen_video_player.dart';
import 'package:movies_app/components/wrappers/wrapper_safearea.dart';

class MovieWatch extends StatefulWidget {
  const MovieWatch({Key? key}) : super(key: key);

  @override
  State<MovieWatch> createState() => _MovieWatchState();
}

class _MovieWatchState extends State<MovieWatch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: FullscreenVideoPlayer(),
      ),
    );
  }
}
