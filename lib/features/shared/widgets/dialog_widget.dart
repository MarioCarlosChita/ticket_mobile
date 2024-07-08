import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    required this.description,
    required this.leftButtonAction,
    required this.leftButtonTitle,
    required this.rightButtonAction,
    required this.rightButtonTitle,
    required this.title,
    this.buttonsPadding,
    this.child,
    this.descriptionColor,
    this.icon,
    super.key,
  });

  final EdgeInsetsGeometry? buttonsPadding;
  final String description;
  final Color? descriptionColor;
  final VoidCallback? leftButtonAction;
  final String leftButtonTitle;
  final VoidCallback? rightButtonAction;
  final String rightButtonTitle;
  final String title;
  final Widget? child;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: deviceSize.width * 0.8,
          maxWidth: deviceSize.width * 0.8,
          maxHeight: deviceSize.width * 0.6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null)
              Container(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                height: 48 + 16,
                width: 48 + 16,
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      icon,
                    ),
                  ),
                ),
              ),
            _buildTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: descriptionColor,
                    ),
                  ),
                ),
              ),
            ),
            if (child != null) ...<Widget>[
              const SizedBox(height: 5),
              Flexible(child: child!),
            ],
            _buttonsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: icon != null
          ? const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24,
            )
          : const EdgeInsets.only(
              top: 24,
              bottom: 16,
              left: 24,
              right: 24,
            ),
      child: Align(
        alignment: icon != null ? Alignment.center : Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
          ),
          textAlign: icon != null ? TextAlign.center : TextAlign.left,
        ),
      ),
    );
  }

  Widget _buttonsList() {
    return Padding(
      padding: buttonsPadding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: leftButtonAction,
            child: Text(
              leftButtonTitle,
              style: const TextStyle(
                color: ColorTheme.primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: rightButtonAction,
            child: Text(
              rightButtonTitle,
              style: const TextStyle(
                color: ColorTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
