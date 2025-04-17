import 'dart:async';
import 'package:covid_tracker/view/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false);

    // Start the timer to navigate to the next screen after 4 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WorldStates()),
      );
    });
  }

  // Dispose the AnimationController when the widget is removed from the widget tree
  // to free up resources and prevent memory leaks.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //AnimatedBuilder is used to animate the rotation of the image
          AnimatedBuilder(
            animation: _controller,
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/virus.png'),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // name of the app
          Text(
            textAlign: TextAlign.center,
            'Covid Tracker',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.28),
          // developer name
          Text(
            textAlign: TextAlign.center,
            'developer : @dharmtejaa',
            style: TextStyle(fontSize: 20, color: Colors.grey[400]),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      ),
    );
  }
}
