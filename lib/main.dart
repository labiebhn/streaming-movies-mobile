import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie/movie_cubit.dart';
import 'package:movies_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movies_app/routes/tab_home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesCubit>(create: (context) => MoviesCubit()),
        BlocProvider<MovieDetailCubit>(create: (context) => MovieDetailCubit()),
      ],
      child: MaterialApp(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xFFFAFAFA),
                displayColor: const Color(0xFFFAFAFA),
              ),
        ),
        themeMode: ThemeMode.dark,
        home: const HomeTab(),
      ),
    );
  }
}
