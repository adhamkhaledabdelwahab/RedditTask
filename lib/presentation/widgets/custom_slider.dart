import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.thumbColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.value,
    required this.min,
    required this.max,
    this.divisions,
    this.trackHeight,
    required this.onChanged,
    required this.onChangeEnd,
  });

  final Color thumbColor;
  final Color activeColor;
  final Color inactiveColor;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final double? trackHeight;
  final Function(double nVal) onChanged;
  final Function(double nVal) onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: trackHeight,
        trackShape: CustomTrackShape(),
      ),
      child: Slider(
        thumbColor: thumbColor,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
