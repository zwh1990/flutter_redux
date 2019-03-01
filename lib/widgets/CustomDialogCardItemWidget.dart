import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogCardItemWidget extends StatelessWidget {

  final Widget child;
  final EdgeInsets margin;
  final Color color;
  final RoundedRectangleBorder shape;
  final double elevation;

  CustomDialogCardItemWidget(
      {@required this.child,
      this.margin,
      this.color,
      this.shape,
      this.elevation = 5.0});

  @override
  Widget build(BuildContext context) {

    EdgeInsets margin = this.margin;
    Color color = this.color;
    RoundedRectangleBorder shape = this.shape;

    margin ??= EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0);
    shape ??= new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)));
    color ??= new Color(0xFFFFFFFF);
    return new Card(elevation: elevation, shape: shape, color: color, margin: margin, child: child);

  }
}
