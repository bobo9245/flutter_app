import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final uri = Uri.parse('https://blog.naver.com/boboblog');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(uri);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: const Text('bobo9245의 블로그',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          centerTitle: true,
          elevation: 5,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                controller.loadRequest(uri);
              },
              icon: const Icon(
                Icons.replay_outlined,
              ),
            )
          ],
        ),
        body: WebViewWidget(controller: controller));
  }
}
