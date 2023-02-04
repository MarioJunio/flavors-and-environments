import 'package:circle_gadget/circle_gadget.dart';
import 'package:flavors/flavor_config.dart';
import 'package:flavors/src/app/ui/widgets/app_text_presentation_animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _gadgetValueTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _gadgetValueTween = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
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
            SizedBox(
              width: double.infinity,
              child: Center(
                child: _textSlideAnimation,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _animatedBuilder(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedBuilder _animatedBuilder(context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          const double width = 200;
          const double height = 200;

          return SizedBox.fromSize(
            size: const Size(width, height),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${_gadgetValueTween.value.toInt()} km/h",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
                CircularGadgetWidget(
                  width: width,
                  height: height,
                  strokeColor: Theme.of(context).primaryColor.withAlpha(40),
                  strokeValueColor: Theme.of(context).primaryColor,
                  centerColor: Colors.grey.withAlpha(10),
                  strokeWidth: 8,
                  min: 0.0,
                  max: 180.0,
                  value: _gadgetValueTween.value,
                ),
              ],
            ),
          );
        },
      );

  get _textSlideAnimation => AppTextPresentationAnimation(
        controller: _animationController,
        text: "Iniciando corrida!!!",
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
