import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/screens/movies/movie_watch.dart';
import 'package:movies_app/utils/fonts.dart';
import 'package:movies_app/utils/palettes.dart';

class LastWatchedMovie extends StatefulWidget {
  const LastWatchedMovie({Key? key}) : super(key: key);

  @override
  State<LastWatchedMovie> createState() => _LastWatchedMovieState();
}

class _LastWatchedMovieState extends State<LastWatchedMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: LinearProgressIndicator(
                      minHeight: 2.0,
                      value: 0.64,
                      backgroundColor: Palettes.textDisabled,
                      valueColor:
                          AlwaysStoppedAnimation<Color?>(Palettes.primary),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: const Text(
                    '1 hr 34 min',
                    style: Fonts.small,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const MovieWatch(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Palettes.primary,
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Continue Watch',
              style: Fonts.h5.merge(
                TextStyle(
                  color: Palettes.text,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
