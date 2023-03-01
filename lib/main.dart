import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PlatformView WebView'),
        ),
        body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.teal,
                pinned: true,
                expandedHeight: 180,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: WebView(),
                  // HeaderContainer is a native View (AndroidView)
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  for (var i = 0; i < 10; i++)
                    Image.network('https://i.imgur.com/QCNbOAo.png')
                ]),
              )
            ]));
  }
}

class WebView extends StatefulWidget {
  const WebView({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'platformviewtype',
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the map view plugin');
  }

}

