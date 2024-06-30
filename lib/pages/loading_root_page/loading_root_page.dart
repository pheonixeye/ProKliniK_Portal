import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portal/assets/assets.dart';
import 'package:portal/extensions/after_layout.dart';
import 'package:portal/providers/locale_px.dart';
import 'package:provider/provider.dart';

class LoadingRootPage extends StatefulWidget {
  const LoadingRootPage({super.key});

  @override
  State<LoadingRootPage> createState() => _LoadingRootPageState();
}

class _LoadingRootPageState extends State<LoadingRootPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<PxLocale>().setLocale();
    context.go("/${context.read<PxLocale>().lang}");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(Assets.icon),
        ),
      ),
    );
  }
}
