import 'package:flutter/material.dart';
import 'package:hb_flutter/screens/home.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final List<Widget> allWidgets = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                icon: const Icon(
                  Icons.home_rounded,
                  color: Colors.black87,
                  size: 28,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: const Icon(
                  Icons.analytics_rounded,
                  color: Colors.black87,
                  size: 28,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                icon: const Icon(
                  Icons.widgets_rounded,
                  color: Colors.black87,
                  size: 28,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                icon: const Icon(
                  Icons.person_2_rounded,
                  color: Colors.black87,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        body: allWidgets[_currentIndex],
      ),
    );
  }
}

class FinancialDataComponent extends StatelessWidget {
  const FinancialDataComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}
