import 'package:flavors/flavor_config.dart';
import 'package:flavors/src/app/ui/widgets/app_text_presentation_animation.dart';
import 'package:flavors/src/app/ui/widgets/circular_gadget_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> strokeValue;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    strokeValue = Tween<double>(
      begin: 5,
      end: 20,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlavorConfig.title ?? "Does not have"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _startAnimationBtn(context),
            _textSlideAnimation,
            _animatedBuilder(context),
          ],
        ),
      ),
    );
  }

  AnimatedBuilder _animatedBuilder(context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CircularGadgetWidget(
            thumbSize: 150,
            strokeColor: Theme.of(context).primaryColor.withAlpha(50),
            strokeValueColor: Theme.of(context).primaryColor,
            centerColor: Colors.transparent,
            strokeWidth: strokeValue.value,
          );
        },
      );

  get _textSlideAnimation => AppTextPresentationAnimation(
        controller: _animationController,
        text: "Olá seja bem vindo, vamos iniciar a criação da sua conta!",
      );

  Widget _startAnimationBtn(context) => ElevatedButton(
        onPressed: () {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Start Animation",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      );
}
