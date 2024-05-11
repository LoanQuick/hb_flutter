import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorService {
  ///Navigate to a page
  ///
  ///Pass [BuildContext] as [context] and [Widget] as [page]
  Future<Object?> navigate(BuildContext context, Widget page) {
    return Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: page.toString())));
  }

  ///Navigate to a page with slide routing
  ///
  ///Pass [BuildContext] as [context] and [Widget] as [page]

  void pop(BuildContext context, {Object? obj}) {
    if (ModalRoute.of(context)!.isFirst) {
      Navigator.of(context).pop(obj);

      // showDialog(
      //     context: context, builder: (context) => const CustomLeavePopUp());
    } else {
      Navigator.of(context).pop(obj);
    }
  }

  ///Pop current page and navigate to a page
  ///
  ///Pass [BuildContext] as [context] and [Widget] as [page]
  Future<Object?> replaceNavigate(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: page.toString())));
  }

  ///Pop to first page and navigate to a page
  ///
  ///Pass [BuildContext] as [context] and [Widget] as [page]
  Future<Object?> clearNavigate(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: page.toString())));
  }

  void listNavigate(BuildContext context, List<Widget> pages) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => pages.first,
        settings: RouteSettings(name: pages.first.toString())));
    for (int i = 1; i < pages.length; i++) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => pages[i],
          settings: RouteSettings(name: pages[i].toString())));
    }
  }

  ///Show a snackbar
  ///
  ///Pass [BuildContext] as [context] and [String] as [msg]
  showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // behavior: SnackBarBehavior.,
        content: Text(msg, style: Theme.of(context).primaryTextTheme.bodyLarge),
        backgroundColor: Theme.of(context).colorScheme.secondary));
  }
}
