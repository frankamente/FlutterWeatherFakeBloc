import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_example/pages/weather_search_page.dart';

import 'bloc/weather_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
        child: WeatherSearchPage(),
      ),
    );
  }
}
