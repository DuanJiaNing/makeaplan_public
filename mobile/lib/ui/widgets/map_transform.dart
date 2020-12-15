import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';

class MAPTransform extends StatefulWidget {
  final double afterHeight;
  final double beforeHeight;

  final Widget before;
  final Widget after;
  final bool showAfter;
  final Duration duration;

  const MAPTransform(
      {Key key,
      this.before,
      this.after,
      this.showAfter = false,
      this.afterHeight = 230,
      this.beforeHeight = 60,
      this.duration = const Duration(milliseconds: 200)})
      : super(key: key);

  @override
  _MAPTransformState createState() => _MAPTransformState();
}

class _MAPTransformState extends State<MAPTransform> {
  @override
  Widget build(BuildContext context) {
    bool _afterOffstage = !widget.showAfter;
    double _afterOpacity = widget.showAfter ? 1 : 0;
    double _beforeOpacity = widget.showAfter ? 0 : 1;
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          _afterOffstage = !widget.showAfter;
        });
      },
      height:
          widget.showAfter ? widget.afterHeight + 2 : widget.beforeHeight + 2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius_x)),
      ),
      duration: widget.duration,
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: widget.showAfter,
            child: AnimatedOpacity(
              opacity: _beforeOpacity,
              duration: widget.duration,
              child: SizedBox(
                width: double.infinity,
                height: widget.beforeHeight,
                child: widget.before,
              ),
            ),
          ),
          Offstage(
            offstage: _afterOffstage,
            child: AnimatedOpacity(
              opacity: _afterOpacity,
              duration: widget.duration,
              child: SizedBox(
                width: double.infinity,
                height: widget.afterHeight,
                child: widget.after,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
