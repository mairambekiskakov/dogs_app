import 'package:flutter/material.dart';

import '../../button.dart';
import 'cats_page.dart';
import 'dogs_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomSlidingToggle(
            leftLabel: 'Dogs',
            rightLabel: 'Cats',
            onChange: (val) {
              _currentVal = val;
              setState(() {});
              print(val);
            },
          ),
        ),
        body: _currentVal == 0 ? DogsPage() : const CatsPage());
  }
}
