import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/consts/date_parse.dart';

DateTime? first;
DateTime? second;

class WidgetDateRangePicker extends StatefulWidget {
  const WidgetDateRangePicker({super.key});

  @override
  State<WidgetDateRangePicker> createState() => _WidgetDateRangePickerState();
}

class _WidgetDateRangePickerState extends State<WidgetDateRangePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: _startDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now());
              if (date == null) {
                return;
              } else {
                setState(() {
                  _startDate = date;
                });
                first = _startDate;
              }
              print(date);
            },
            child: Text(
                _startDate == null ? 'Start Date' : parseDate(_startDate!))),
        // TextFormField(
        //   decoration: InputDecoration(labelText: 'Start Date'),
        //   onTap: () async {
        //     // DateTime date = await showDatePicker(
        //     //   context: context,
        //     //   initialDate: _startDate ?? DateTime.now(),
        //     //   firstDate: DateTime(2020),
        //     //   lastDate: DateTime.now(),
        //     // );
        //     final date = await showDatePicker(
        //         context: context,
        //         initialDate: _startDate,
        //         firstDate: DateTime(2020),
        //         lastDate: DateTime.now());
        //     if (date == null) {
        //       return;
        //     }else{
        //       setState(() {
        //         _startDate = date;
        //       });
        //     }
        //   },
        //   // controller: TextEditingController(
        //   //   text: _startDate == null
        //   //       ? ''
        //   //       : DateFormat('dd/MM/yyyy').format(_startDate),
        //   // ),
        // ),
        TextButton(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                  context: context,
                  initialDate:
                      _startDate != null ? _startDate! : DateTime.now(),
                  firstDate:_startDate != null ? _startDate! : DateTime.now(),
                  lastDate:
                      DateTime.now());
              if (date != null) {
                setState(() {
                  _endDate = date;
                });
                second = _endDate;
              }
              print(date);
            },
            child:
                Text(_endDate == null ? 'End Date' : parseDate(_endDate!))),
        // TextFormField(
        //   decoration: InputDecoration(labelText: 'End Date'),
        //   onTap: () async {
        //     // DateTime date = await showDatePicker(
        //     //   context: context,
        //     //   initialDate: _endDate ?? DateTime.now(),
        //     //   firstDate: DateTime(2020),
        //     //   lastDate: DateTime.now(),
        //     // );
        //     DateTime? date = await showDatePicker(
        //         context: context,
        //         initialDate: DateTime.now(),
        //         firstDate: DateTime(2020),
        //         lastDate: _startDate != null ? _startDate! : DateTime.now());
        //     if (date != null) {
        //       setState(() {
        //         _endDate = date;
        //       });
        //     }
        //   },
        //   // controller: TextEditingController(
        //   //   text: _endDate == null
        //   //       ? ''
        //   //       : DateFormat('dd/MM/yyyy').format(_endDate),
        //   // ),
        // ),
        Icon(Icons.check,color: backBlack,)
      ],
    );
  }
}
