import 'package:flutter/material.dart';
import 'package:hb_flutter/screens/home_nav.dart';
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
            Image.asset("assets/images/LoanQuick.png"),
            const Text("Connect Zoho Account"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await ApiService().apiGetRedirect(
                    endpoint:
                        "https://accounts.zoho.in/oauth/v2/auth?scope=ZohoBooks.fullaccess.all&client_id=1000.S6S63N32DO2XVGA7BSX5MAJ8RK792N&state=testing&response_type=code&redirect_uri=https://zg97h4jr-8000.inc1.devtunnels.ms/zoho/setup&access_type=offline",
                    context: context);

                print(response.toString());
                await Future.delayed(const Duration(seconds: 2));
                if (context.mounted) {
                  NavigatorService().navigate(
                    context,
                    const HomeNav(),
                  );
                }
              },
              child: const Text(
                "Login with Zoho Books",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
