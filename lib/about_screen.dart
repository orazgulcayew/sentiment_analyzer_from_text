import 'package:flutter/material.dart';

import 'constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('About us'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/about.gif"),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    "assets/images/about.png",
                    height: 200,
                  ),
                ),
                Container(
                  height: (160),
                  width: (160),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/humanimaly_logo.png"),
                    fit: BoxFit.cover,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/male.png"),
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/female.png"),
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/male.png"),
                      radius: 25,
                    ),
                  ],
                ),
                const SizedBox(height: (20)),
                const Text(
                  "Thanks for checking us out!",
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  'We are a team of three ;)\n Yeshwin Anil, Archana Sahoo & Powel Shoby.\n'
                  'This project was created as a part of \nour fourth year BE curriculum.'
                  '\nWe hope you liked our work!',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: (10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
