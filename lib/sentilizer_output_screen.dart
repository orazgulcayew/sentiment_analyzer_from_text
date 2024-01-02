import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class SentilizerOutputScreen extends StatelessWidget {
  final SentimentResult sentimentOutput;

  const SentilizerOutputScreen({super.key, required this.sentimentOutput});

  String get emojiOutput {
    if (sentimentOutput.score > 0) {
      return "assets/images/happy.jpg";
    } else if ((sentimentOutput.score < 0)) {
      return "assets/images/sad.jpg";
    } else {
      return "assets/images/neutral.jpg";
    }
  }

  String get bgOutput2 {
    if (sentimentOutput.score > 0) {
      return "assets/images/happy.png";
    } else if ((sentimentOutput.score < 0)) {
      return "assets/images/sad.png";
    } else {
      return "assets/images/neutral.jpg";
    }
  }

  Gradient get bgOutput {
    if (sentimentOutput.score > 0) {
      return const LinearGradient(
          colors: [Colors.greenAccent, Colors.green],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter);
    } else if ((sentimentOutput.score < 0)) {
      return const LinearGradient(colors: [
        Color.fromARGB(255, 237, 237, 237),
        Color.fromARGB(255, 125, 125, 125)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
    } else {
      return const LinearGradient(
          colors: [Colors.pinkAccent, Colors.purpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter);
    }
  }

  String get sentilizerOutput {
    if (sentimentOutput.score > 0) {
      return "very well don't worry";
    } else if ((sentimentOutput.score < 0)) {
      return "Negative";
    } else {
      return "Neutral";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_left, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Depression result'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: sentimentOutput.score > 0 ? Colors.white : null,
          image: DecorationImage(
              image: AssetImage(emojiOutput),
              fit: sentimentOutput.score > 0 ? BoxFit.contain : BoxFit.cover),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 124,
                ),
                Text("Score: ${sentimentOutput.score.toString()}"),
                const SizedBox(height: 12),
                Text(
                  "Analyzed depression state is $sentilizerOutput",
                  // speed: const Duration(milliseconds: 50),
                  // isRepeatingAnimation: false,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   width: 200,
                //   child: Stack(
                //     fit: StackFit.expand,
                //     children: [
                //       Hero(
                //         tag: 'logo',
                //         child: Image.asset(emojiOutput),
                //       ),
                //     ],
                //   ),
                // ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
