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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "LetsGrow",
          style: TextStyle(
              color: Color.fromRGBO(12, 192, 223, 1.0),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 95, 94, 94),
      ),
      backgroundColor: const Color(0xffeeeeee),
      body: const WebView(
        initialUrl: 'https://letsgrowdp2-52e1b.web.app/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
