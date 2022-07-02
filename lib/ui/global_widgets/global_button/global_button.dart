import 'package:flutter/material.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    Key? key,
    required this.onTap,
    required this.radius,
    this.padding,
    this.style,
    this.onHoverTextStyle,
    this.text,
    this.child,
    this.gradient,
    this.shadow,
    this.onHoverGradient,
    this.onHoverShadow,
    this.width,
    this.height,
    this.activateOnHoldFunctionality = false,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? text;
  final Widget? child;
  final LinearGradient? gradient;
  final List<BoxShadow>? shadow;
  final TextStyle? style;
  final TextStyle? onHoverTextStyle;
  final double radius;
  final Function() onTap;
  final LinearGradient? onHoverGradient;
  final List<BoxShadow>? onHoverShadow;
  final EdgeInsetsGeometry? padding;
  final bool activateOnHoldFunctionality;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (bool value) {
        if (widget.activateOnHoldFunctionality) {
          setState(() => onHover);
        }
      },
      radius: widget.radius,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          gradient: onHover ? widget.onHoverGradient : widget.gradient,
          boxShadow: onHover ? widget.onHoverShadow : widget.shadow,
        ),
        child: widget.child ??
            Text(
              widget.text!,
              style: onHover ? widget.onHoverTextStyle : widget.style,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
