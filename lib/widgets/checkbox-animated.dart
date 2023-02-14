import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class AnimatedSwitch extends StatefulWidget {
  final IconData checkIcon;
  final IconData unCheckIcon;
  final Color checkColor;
  final Color unCheckColor;
  final String checkText;
  final String unCheckText;
  final Function(bool) onTap;
  const AnimatedSwitch(
      {Key? key,
      this.checkText = "YES",
      this.unCheckText = "NO",
      this.checkColor = Colors.green,
      this.unCheckColor = Colors.red,
      this.checkIcon = Icons.check_circle,
      this.unCheckIcon = Icons.coronavirus_rounded,
      required this.onTap})
      : super(key: key);

  @override
  State<AnimatedSwitch> createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      dif: 50.0,
      borderColor: Colors.transparent,
      borderWidth: 5.0,
      height: 55,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5),
        ),
      ],
      onChanged: (b) {
        setState(() => positive = b);
        widget.onTap.call(!b);
        // return Future.delayed(const Duration(seconds: 2));
      },
      colorBuilder: (b) => b ? widget.unCheckColor : widget.checkColor,
      iconBuilder: (value) =>
          value ? Icon(widget.unCheckIcon) : Icon(widget.checkIcon),
      textBuilder: (value) => value
          ? Center(
              child: Text(widget.unCheckText,
                  style: const TextStyle(fontWeight: FontWeight.bold)))
          : Center(
              child: Text(widget.checkText,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
