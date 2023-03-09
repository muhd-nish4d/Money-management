import 'package:flutter/cupertino.dart';

class DateRangePickerWidget extends StatefulWidget {
  final Function(DateTime, DateTime) onDateRangeSelected;

  DateRangePickerWidget({required this.onDateRangeSelected});

  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _startDate,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _startDate = newDateTime;
              });
              widget.onDateRangeSelected(_startDate, _endDate);
            },
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _endDate,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _endDate = newDateTime;
              });
              widget.onDateRangeSelected(_startDate, _endDate);
            },
          ),
        ),
      ],
    );
  }
}