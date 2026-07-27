import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({super.key});

  @override
  State<ProgressDemo> createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                 
                vertical: 3,
              ),
              child: LinearPercentIndicator(
                percent: _controller.value,
                lineHeight: 15,
                  width: MediaQuery.of(context).size.width - 174,
                barRadius: const Radius.circular(23),
               backgroundColor: Colors.blueGrey.shade100,
              progressColor: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${(_controller.value * 100).toInt()}..Loading",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }
}