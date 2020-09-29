import 'package:flutter/material.dart';
import 'package:world_time_app/pages/Home.dart';
// import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/select_location.dart';
import 'package:world_time_app/pages/time.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/time': (context) => Time(),
        '/location': (context) => SelectCity(),
      },
    ));
