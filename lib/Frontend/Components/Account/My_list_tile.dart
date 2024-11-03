import 'package:flutter/material.dart';


class MyListTile extends StatefulWidget {
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final String title;
  const MyListTile({
    super.key,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leadingIcon,
      trailing: widget.trailingIcon,
      title: Text(widget.title),
    );
  }
}