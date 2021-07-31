import 'package:flutter/material.dart';

class LoginTile extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final Color? tileColor;
  final void Function()? onTap;

  const LoginTile({
    Key? key,
    required this.text,
    required this.icon,
    this.tileColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SizedBox(
            height: 56.0,
            width: 56.0,
            child: Center(
              child: this.icon,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: this.text,
            ),
          ),
        ],
      ),
    );
  }
}
