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
              'https://www.flipkart.com/?s_kwcid=AL!739!3!582822043916!e!!g!!flipkart&gclsrc=aw.ds&&semcmpid=sem_8024046704_brand_exe_buyers_goog&gclid=EAIaIQobChMIr--5_4f1-AIV35lmAh2Qcw_WEAAYASAAEgJk2PD_BwE',
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
          return AlertDialog(
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
