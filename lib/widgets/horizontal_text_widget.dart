import 'package:flutter/material.dart';

class HorizontalTextWidget extends StatelessWidget {
  const HorizontalTextWidget({
    super.key, required this.title, this.trailing, this.style, this.contentPadding,
  });
  final String title;
  final Widget? trailing;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(contentPadding:contentPadding,title:Text(title,style: style,), trailing: trailing,);
  }
}