import 'package:flutter/material.dart';

class ElevatedGradientButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final IconData? iconData;

  const ElevatedGradientButtonWidget({
    Key? key,
    @required this.text,
    @required this.onPressed,
    this.iconData,
  }) : super(key: key);

  ElevatedButton _elevatedButtonWithIcon() {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(text!),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      icon: Icon(iconData),
    );
  }

  ElevatedButton _elevatedButton() {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text!),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).buttonColor,
            Theme.of(context).highlightColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            offset: Offset(0.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: iconData != null ? _elevatedButtonWithIcon() : _elevatedButton(),
    );
  }
}
