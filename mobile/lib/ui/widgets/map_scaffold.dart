import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';

class MAPScaffold extends StatefulWidget {
  final Widget body;
  final Widget appBar;
  final Widget inProgressMask;
  final VoidCallback onRefresh;
  final Color appBarBackgroundColor;

  const MAPScaffold(
      {Key key,
      this.body,
      this.appBar,
      this.inProgressMask,
      this.onRefresh,
      this.appBarBackgroundColor = Colors.transparent})
      : super(key: key);

  @override
  _MAPScaffoldState createState() => _MAPScaffoldState();
}

class _MAPScaffoldState extends State<MAPScaffold> {
  ScrollController _scrollController = new ScrollController();
  bool _barShow = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        if (!_barShow) {
          setState(() {
            _barShow = true;
          });
        }
        return;
      } else {
        if (_barShow) {
          setState(() {
            _barShow = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            color: ThemManager().themColors().refreshIndicator.icon,
            backgroundColor:
                ThemManager().themColors().refreshIndicator.background,
            displacement: 60,
            onRefresh: () async {
              widget.onRefresh();
              return;
            },
            child: Stack(
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: widget.appBar == null
                              ? null
                              : Container(
                                  color: widget.appBarBackgroundColor,
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top + padding_x,
                                  ),
                                  child: widget.appBar,
                                ),
                        ),
                        Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: MediaQuery.of(context).size.height),
                            child: widget.body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buildTopBlankAppBar(context, _barShow),
              ],
            ),
          ),
          Container(
            child: widget.inProgressMask,
          ),
        ],
      ),
    );
  }
}
