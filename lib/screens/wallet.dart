import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

int selectedIndex = 0;

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: Text(
                "Your Wallet",
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.black : Colors.black45,
                  fontWeight:
                      selectedIndex == 0 ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              width: 0.0,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Text(
                  "Current Loans",
                  style: TextStyle(
                    color: selectedIndex == 1 ? Colors.black : Colors.black45,
                    fontWeight:
                        selectedIndex == 1 ? FontWeight.bold : FontWeight.w400,
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const MyWallet(),
        const SizedBox(
          height: 600,
        ),
      ],
    );
  }
}

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Balance",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "₹5,00,010",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.wallet_rounded,
              color: Colors.black45,
              size: 80,
            )
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          "Recent Loan Repayments",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
