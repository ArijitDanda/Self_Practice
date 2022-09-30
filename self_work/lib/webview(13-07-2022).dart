import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewpractice extends StatefulWidget {
  const Webviewpractice({Key? key}) : super(key: key);

  @override
  State<Webviewpractice> createState() => _WebviewpracticeState();
}

class _WebviewpracticeState extends State<Webviewpractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl:
              'https://twitter.com/explore',
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (value) {
            value = showprogress();
          },
          onPageFinished: (value) {
            hideprogress();
          },
        ),
      ),
    );
  }

  showprogress() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: CupertinoActivityIndicator(
              radius: 20,
            ),
          );
        });
  }

  hideprogress() {
    Navigator.pop(context);
  }
}
