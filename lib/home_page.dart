import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimasyon extends StatefulWidget {
  const LottieAnimasyon({super.key});

  @override
  State<LottieAnimasyon> createState() => _LottieAnimasyonState();
}

class _LottieAnimasyonState extends State<LottieAnimasyon>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/loading.json",
            // "assets/flutter.json",
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
            },
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _controller.stop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .red, // Bu kısmı istediğiniz renginle değiştirebilirsiniz
                ),
                child: const Text('Pause'),
              ),
              ElevatedButton(
                onPressed: () => _controller.forward(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .blue, // Bu kısmı istediğiniz renginle değiştirebilirsiniz
                ),
                child: const Text('Resume'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.reset();
                  _controller.forward();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .green, // Bu kısmı istediğiniz renginle değiştirebilirsiniz
                ),
                child: const Text('Repeat'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
