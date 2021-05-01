import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'リストビューサンプル';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainPage(title: title),
    );
  }
}
class MainPage extends StatefulWidget {
  final String title;

  const MainPage({ @required this.title });
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Text('リストビュー'),
            title: Text('基本'),
          ),
          BottomNavigationBarItem(
            icon: Text('リストビュー'),
            title: Text('縦'),
          ),
          BottomNavigationBarItem(
            icon: Text('リストビュー'),
            title: Text('横'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            this.currentIndex = index;
          });
        },
      ),
    );
  }
}