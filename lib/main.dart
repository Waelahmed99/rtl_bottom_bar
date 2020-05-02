import 'package:bottom_bar/rtl_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _currentIdx = 0;

  List<RTLbottomItem> _items = [
    RTLbottomItem(title: 'الرئيسية', icon: 'assets/home.svg'),
    RTLbottomItem(title: 'بحث', icon: 'assets/search.svg'),
    RTLbottomItem(title: 'كتبي', icon: 'assets/book.svg'),
    RTLbottomItem(title: 'المزيد', icon: 'assets/more.svg')
  ];

  List<Widget> _routes = [
    Center(child: Text('الرئيسية')),
    Center(child: Text('بحث')),
    Center(child: Text('كتبي')),
    Center(child: Text('المزيد')),
  ];

  Widget _buildRTLBottomBar() {
    return RTLBottomBar(
      currentIndex: _currentIdx,
      onTap: (int idx) => setState(() {
        _currentIdx = idx;
      }),
      backgroundColor: Colors.white,
      items: _items,
      textColor: Color(0xfff95563),
      selectedItemColor: Color(0xfff95563),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Gulf'),
      home: Scaffold(
        appBar: AppBar(title: Text('RTL Bottom Navigation')),
        body: _routes[_currentIdx],
        bottomNavigationBar: _buildRTLBottomBar(),
      ),
    );
  }
}
