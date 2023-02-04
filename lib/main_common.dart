import 'package:circle_gadget/examples/example_page.dart';
import 'package:flavors/flavor_config.dart';
import 'package:flavors/src/app/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void mainCommon(Env env) {
  FlavorConfig.init(env);

  runApp(
    MaterialApp(
      title: FlavorConfig.title!,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          labelMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            fontSize: 18,
          ),
        ),
      ),
      home: env == Env.dev ? const HomePage() : const ExamplePage(),
    ),
  );
}
