// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

typedef ContextMenuOnPressed = Function(BuildContext context);

/// A button in a _ContextMenuSheet.
///
/// A typical use case is to pass a [Text] as the [child] here, but be sure to
/// use [TextOverflow.ellipsis] for the [Text.overflow] field if the text may be
/// long, as without it the text will wrap to the next line.
class CupertinoContextMenuAction extends StatefulWidget {
  /// Construct a CupertinoContextMenuAction.
  const CupertinoContextMenuAction({
    Key key,
    @required this.child,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.onPressed,
    this.trailingIcon,
    this.showDivider = true,
  })  : assert(child != null),
        assert(isDefaultAction != null),
        assert(isDestructiveAction != null),
        super(key: key);

  final bool showDivider;

  /// The widget that will be placed inside the action.
  final Widget child;

  /// Indicates whether this action should receive the style of an emphasized,
  /// default action.
  final bool isDefaultAction;

  /// Indicates whether this action should receive the style of a destructive
  /// action.
  final bool isDestructiveAction;

  /// Called when the action is pressed.
  final ContextMenuOnPressed onPressed;

  /// An optional icon to display to the right of the child.
  ///
  /// Will be colored in the same way as the [TextStyle] used for [child] (for
  /// example, if using [isDestructiveAction]).
  final IconData trailingIcon;

  @override
  _CupertinoContextMenuActionState createState() =>
      _CupertinoContextMenuActionState();
}

class _CupertinoContextMenuActionState
    extends State<CupertinoContextMenuAction> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemManager().themColors().dialog.background,
      child: InkWell(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed(context);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: widget.showDivider
                ? Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: ThemManager().themColors().basic.divider),
                  )
                : null,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: padding_2x,
            horizontal: padding_3x,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: widget.child,
              ),
              if (widget.trailingIcon != null)
                Icon(
                  widget.trailingIcon,
                  color: ThemManager().themColors().basic.warning,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
