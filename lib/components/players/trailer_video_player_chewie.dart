// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:movies_app/utils/fonts.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class TrailerVideoPlayer extends StatefulWidget {
//   const TrailerVideoPlayer({Key? key}) : super(key: key);

//   @override
//   State<TrailerVideoPlayer> createState() => _TrailerVideoPlayerState();
// }

// class _TrailerVideoPlayerState extends State<TrailerVideoPlayer> {
//   TargetPlatform? _platform;
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;
//   int? bufferDelay;

//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   List<String> srcs = [
//     "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
//     "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
//     "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"
//   ];

//   Future<void> initializePlayer() async {
//     _videoPlayerController = VideoPlayerController.network(srcs[currPlayIndex]);
//     await _videoPlayerController.initialize();
//     _createChewieController();
//     setState(() {});
//   }

//   void _createChewieController() {
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: false,
//       looping: false,
//       showOptions: false,
//       fullScreenByDefault: true,
//       hideControlsTimer: const Duration(seconds: 1),

//       // Try playing around with some of these other options:

//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//   }

//   int currPlayIndex = 1;

//   Future<void> toggleVideo() async {
//     await _videoPlayerController.pause();
//     currPlayIndex += 1;
//     if (currPlayIndex >= srcs.length) {
//       currPlayIndex = 0;
//     }
//     await initializePlayer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _chewieController != null &&
//               _chewieController!.videoPlayerController.value.isInitialized
//           ? ClipRRect(
//               borderRadius: BorderRadius.circular(4.0),
//               child: AspectRatio(
//                 aspectRatio: _videoPlayerController.value.aspectRatio,
//                 child: Chewie(
//                   controller: _chewieController!,
//                 ),
//               ),
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 20),
//                 Text('Loading'),
//               ],
//             ),
//     );
//   }
// }
