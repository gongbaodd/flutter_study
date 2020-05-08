import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget build() {
  return MaterialApp(
    home: Home(),
  );
}

Animation useFadeIn() {
  final ticker = useSingleTickerProvider();
  final controller = useMemoized(() => AnimationController(
      duration: const Duration(milliseconds: 3000), vsync: ticker));
  final animation = useMemoized(() => Tween(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn)));

  useEffect(() {
    controller.forward();
    return () => controller.dispose();
  });

  return animation;
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animation = useFadeIn();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Container(
            height: 300.0,
            width: 300.0,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
