import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hb_flutter/services/api_service.dart';

class LoanVendorScreen extends StatelessWidget {
  LoanVendorScreen({super.key});

  final ValueNotifier<bool> isLoaded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: ApiService().apiGet(
        endpoint: "https://zsk18d91-8000.inc1.devtunnels.ms/loan-vendor",
        context: context,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        log(snapshot.data.toString());
        isLoaded.value = true;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Verified Loan Vendors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
              ] +
              List<Widget>.generate(
                snapshot.data['data'].length,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      color: Colors.white,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        snapshot.data['data'][index]["name"],
                      ),
                      leading: Image.network(
                        snapshot.data['data'][index]["image"],
                        width: 50,
                      ),
                      subtitle: const Row(
                        children: [
                          Text("Verified"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.verified,
                            size: 15,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      children: const [],
                    ),
                  ),
                ),
              ) +
              [
                const SizedBox(
                  height: 500,
                ),
              ],
        );
      },
    );
  }
}
