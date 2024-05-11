import 'package:flutter/material.dart';
import 'package:hb_flutter/screens/home.dart';
import 'package:hb_flutter/screens/wallet.dart';
import 'package:hb_flutter/services/color.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final List<Widget> allWidgets = [
    const HomeScreen(),
    const WalletScreen(),
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
                icon: Icon(
                  Icons.home_rounded,
                  color: _currentIndex == 0 ? Colors.black87 : Colors.black45,
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
                icon: Icon(
                  Icons.wallet_rounded,
                  color: _currentIndex == 1 ? Colors.black87 : Colors.black45,
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
                icon: Icon(
                  Icons.widgets_rounded,
                  color: _currentIndex == 2 ? Colors.black87 : Colors.black45,
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
                icon: Icon(
                  Icons.person_2_rounded,
                  color: _currentIndex == 3 ? Colors.black87 : Colors.black45,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor.fromHex("#DAD5FB"),
                HexColor.fromHex("#FFFFFF"),
              ],
              begin: Alignment.topCenter,
            ),
            // image:
            // color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: FlutterLogo(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Hi, Abhinav!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.chat_rounded,
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.notifications_active_rounded,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  allWidgets[_currentIndex],
                ],
              ),
            ),
          ),
        ),
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
