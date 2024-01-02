import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sentiment_analyzer_from_text/sentilizer_output_screen.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

import 'about_screen.dart';

String inputText = "";
late SentimentResult sentimentOutput;

class SentilizerInputScreen extends StatelessWidget {
  const SentilizerInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: AppBar(
                title: Row(
                  children: [
                    const Text('Depression analyzer',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const AboutScreen();
                        // }));
                      },
                      color: Colors.white.withOpacity(0.7),
                      icon: const Icon(CupertinoIcons.info),
                    )
                  ],
                ),
                backgroundColor: Colors.pink.withOpacity(0.1)),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/main.jpg"),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Start typing...",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  minLines: 7,
                  maxLines: 7,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (newValue) {
                    inputText = newValue;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.pink.withOpacity(0.3),
                    filled: true,
                    hintText: 'Feelings..',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepPurple.withOpacity(0.3),
                      ),
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Please describe your feelings analyze your feelings. Don't be shy let's talk a bit)",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: Colors.pink.withOpacity(0.3),
                        onPressed: () {
                          if (inputText.isEmpty || inputText.length < 4) {
                            Fluttertoast.showToast(
                                msg: "Your input is too short!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          } else {
                            try {
                              sentimentOutput =
                                  Sentiment.analysis(inputText, emoji: true);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SentilizerOutputScreen(
                                    sentimentOutput: sentimentOutput);
                              }));
                            } catch (e) {
                              print(e);
                              Fluttertoast.showToast(
                                  msg: "Give a Valid Input!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.black,
                                  fontSize: 16.0);
                            }
                          }
                        },
                        child: const Text('Analyze depression'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
