import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Open WebView'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CustomWebView(
                title: "Call LocalHost",
                selectedUrl: "http://sbrental.000.pe/",
              ),
            ));
          },
        ),
      ),
    );
  }
}

class CustomWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  CustomWebView({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
