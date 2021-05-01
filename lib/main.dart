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
  final items = List.generate(70, (counter) => 'Item: $counter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildListView(),
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

  Widget _buildListView() {
    if (currentIndex == 0) {
      return buildBasicListView();
    } else if (currentIndex == 1) {
      return buildVerticalListView();
    } else if (currentIndex == 2) {
      return Container();
    } else {
      return Container();
    }
  }

  Widget buildBasicListView() => ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.star),
        title: Text('府中駅前自転車置き場'),
        subtitle: Text('府中市1-1-7'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('新宿中央自転車置き場'),
        subtitle: Text('新宿区3-4-7'),
        trailing: Icon(Icons.store_mall_directory),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('橋の下自転車置き場'),
        subtitle: Text('狛江市1-32-5'),
        trailing: Icon(Icons.mood, color: Colors.blue,),
      ),
      ListTile(
        leading: Icon(Icons.delete, color: Colors.red,),
        title: Text('削除済み'),
        onTap: () {
          print('削除済みが押されました。');
        },
      ),
    ],
  );

  Widget buildVerticalListView() => ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return Text(item);
    },

  );
}