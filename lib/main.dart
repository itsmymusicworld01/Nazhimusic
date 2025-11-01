import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:myapp/audio_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController? _webViewController;
  late final AudioHandler _audioHandler;

  @override
  void initState() {
    super.initState();
    _audioHandler = AudioHandler();
    _audioHandler.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
  }

  @override
  void dispose() {
    _audioHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter InAppWebView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri('https://flutter.dev')),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _audioHandler.play(),
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: () => _audioHandler.pause(),
                child: const Text('Pause'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
