import 'package:flutter/material.dart';

class YearRange extends StatefulWidget {
  const YearRange({super.key});

  @override
  State<YearRange> createState() => _YearRangeState();
}

class _YearRangeState extends State<YearRange> {
  RangeValues yearRange = const RangeValues(1500, 2020);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      ),
      child: RangeSlider(
        values: yearRange,
        min: 1500,
        max: 2020,
        divisions: 10,
        labels: RangeLabels(
          yearRange.start.round().toString(),
          yearRange.end.round().toString(),
        ),
        onChanged: (RangeValues values){
          setState(() {
            yearRange = values;
          });
        },
      ),
    );
  }
}