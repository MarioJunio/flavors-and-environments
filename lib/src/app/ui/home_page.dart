import 'package:flavors/flavor_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlavorConfig.title ?? "Does not have"),
      ),
      body: Center(
        child: Text("Base url: ${FlavorConfig.baseUrl!}"),
      ),
    );
  }
}
