import 'package:flutter/material.dart';
import 'package:hb_flutter/screens/home.dart';
import 'package:hb_flutter/services/api_service.dart';
import 'package:hb_flutter/services/nav_service.dart';

class ConenctZohoScreen extends StatelessWidget {
  const ConenctZohoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Get all financials from your Zoho Account"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await ApiService().apiGet(
                    endpoint:
                        "https://accounts.zoho.in/oauth/v2/auth?scope=ZohoBooks.fullaccess.all&client_id=1000.S6S63N32DO2XVGA7BSX5MAJ8RK792N&state=testing&response_type=code&redirect_uri=https://zsk18d91-8000.inc1.devtunnels.ms/zoho/setup&access_type=offline",
                    context: context);

                print(response.toString());
                if (context.mounted) {
                  NavigatorService().navigate(
                    context,
                    const HomeScreen(),
                  );
                }
              },
              child: const Text(
                "Connect your Zoho Account",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
