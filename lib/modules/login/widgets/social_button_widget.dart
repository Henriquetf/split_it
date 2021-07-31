import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SocialButton extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const SocialButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.colors.backgroundPrimary,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(5.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.colors.border,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onTap: onTap,
          child: this.child,
          splashColor: AppTheme.colors.buttonSplashColor,
        ),
      ),
    );
  }
}
