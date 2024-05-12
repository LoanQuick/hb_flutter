import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        selectedIndex == 0
            ? MyWallet()
            : const SizedBox(
                height: 500,
              ),
      ],
    );
  }
}

class WalletTransaction {
  final int type;
  final num amount;
  final String description;
  final DateTime date;

  WalletTransaction({
    required this.type,
    required this.amount,
    required this.description,
    required this.date,
  });
}

class MyWallet extends StatelessWidget {
  MyWallet({super.key});

  final ValueNotifier<double> minPerc = ValueNotifier<double>(0);
  final ValueNotifier<double> maxPerc = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            const Row(
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
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Locked for Loan Repayment",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.lock_rounded,
                                size: 35,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            "₹5,00,010",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => SettingsDIalog(
                                  minInit: minPerc.value,
                                  maxInit: maxPerc.value,
                                  callback: (p0, p1) {
                                    minPerc.value = p0;
                                    maxPerc.value = p1;
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              "Change Repayment Settings",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Total Loan Amount Due",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.monetization_on_rounded,
                                size: 35,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            "₹2,00,010",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Pay Lumpsum",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Recent Wallet Transactions",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ] +
          List<Widget>.generate(
            12,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: ListTile(
                  title: const Text("Repayment against Protium"),
                  subtitle: Text(
                    DateFormat('yyyy-MM-dd, HH:mm:ss').format(
                      DateTime.now(),
                    ),
                  ),
                  leading: const Icon(
                    Icons.check_circle_rounded,
                    size: 30.0,
                    color: Colors.greenAccent,
                  ),
                  trailing: Text("₹${(index + 1) * 100}.00"),
                ),
              ),
            ),
          ),
    );
  }
}

class SettingsDIalog extends StatefulWidget {
  const SettingsDIalog({
    super.key,
    required this.callback,
    this.minInit = 0,
    this.maxInit = 0,
  });

  final Function(double, double) callback;
  final double minInit, maxInit;

  @override
  State<SettingsDIalog> createState() => _SettingsDIalogState();
}

class _SettingsDIalogState extends State<SettingsDIalog> {
  double minProfitPerc = 0;
  double maxProfitPerc = 0;

  @override
  void initState() {
    minProfitPerc = widget.minInit;
    maxProfitPerc = widget.maxInit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          6.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Configure Repayment Percentage (on Daily Profit)",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Min Profit Percentage",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: minProfitPerc,
                    min: 0,
                    max: 100,
                    onChanged: (v) {
                      setState(() {
                        minProfitPerc = v;
                      });
                      widget.callback(minProfitPerc, maxProfitPerc);
                    },
                  ),
                ),
                Text(
                  "${minProfitPerc.toStringAsFixed(
                    0,
                  )}%",
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Max Profit Percentage",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: maxProfitPerc,
                    min: 0,
                    max: 100,
                    onChanged: (v) {
                      setState(() {
                        maxProfitPerc = v;
                      });
                      widget.callback(minProfitPerc, maxProfitPerc);
                    },
                  ),
                ),
                Text(
                  "${maxProfitPerc.toStringAsFixed(
                    0,
                  )}%",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Save Settings",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
