import 'package:flavors/flavor_config.dart';
import 'package:flavors/src/app/ui/home_page.dart';
import 'package:flutter/material.dart';

void mainCommon(Env env) {
  FlavorConfig.init(env);

  runApp(
    MaterialApp(
      title: FlavorConfig.title!,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}
