import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: WebView(
        initialUrl: 'https://letsgrowdp2-52e1b.web.app/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
