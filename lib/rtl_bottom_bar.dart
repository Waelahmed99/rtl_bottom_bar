import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RTLBottomBar extends StatefulWidget {
  final List<RTLbottomItem> items;
  final int currentIndex;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  final Color textColor;
  final Color selectedItemColor;

  RTLBottomBar(
      {@required this.items,
      this.currentIndex,
      this.backgroundColor,
      this.onTap,
      this.textColor,
      this.selectedItemColor});

  @override
  State<StatefulWidget> createState() => _RTLBottomBarState();
}

class _RTLBottomBarState extends State<RTLBottomBar> {
  int _currentIdx;

  @override
  void initState() {
    _currentIdx = widget.currentIndex ?? 0;
    super.initState();
  }

  Widget _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.items
          .asMap()
          .map((idx, item) => MapEntry(idx, _buildRowItem(idx, item)))
          .values
          .toList()
          .reversed
          .toList(),
    );
  }

  Widget _buildRowItem(int idx, RTLbottomItem item) {
    bool state = (idx == _currentIdx);
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIdx = idx;
          widget.onTap(_currentIdx);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 650),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
            color: state ? Color(0xfffeebee) : null,
            borderRadius: state ? BorderRadius.circular(20) : null),
        child: _buildItem(item, state),
      ),
    );
  }

  Widget _buildItem(RTLbottomItem item, bool state) {
    return Row(
      children: <Widget>[
        Text(
          item.title,
          style:
              TextStyle(color: state ? widget.selectedItemColor : Colors.black),
        ),
        SizedBox(width: 7),
        SvgPicture.asset(item.icon,
            color: state ? widget.textColor : Colors.black)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentIdx = widget.currentIndex;
    return Container(
      color: widget.backgroundColor,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: _buildRow(),
    );
  }
}

class RTLbottomItem {
  String title;
  String icon;
  RTLbottomItem({@required this.title, @required this.icon});
}
