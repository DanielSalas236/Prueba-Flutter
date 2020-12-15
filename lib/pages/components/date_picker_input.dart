import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:libreria_online/pages/components/date_picker.dart';
import 'package:libreria_online/pages/components/styled_flat_button.dart';

import '../../constants.dart';

class DatePickerInput extends StatefulWidget {
  final DateTime date;
  final Function onChanged;
  final String hintText;
  final FormFieldValidator<String> validator;

  const DatePickerInput({
    this.date,
    @required this.onChanged,
    this.hintText,
    this.validator,
    Key key,
  }) : super(key: key);

  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime _selectedDate;
  TextEditingController _dateController = TextEditingController();

  initState() {
    super.initState();
    if (widget.date != null) {
      String formattedDate = DateFormat.yMd().format(widget.date);
      _dateController = TextEditingController(text: formattedDate);
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              children: [
                StyledFlatButton(
                  'Listo',
                  onPressed: () {
                    // If no date is selected, current date is used.
                    DateTime selectedDate = _selectedDate ?? DateTime.now();
                    widget.onChanged(selectedDate);
                    setState(() {
                      String formattedDate =
                          DateFormat.yMd().format(selectedDate);
                      _dateController =
                          TextEditingController(text: formattedDate);
                    });
                    Navigator.pop(context);
                  },
                  radius: 0.0,
                ),
                Expanded(
                  child: DatePicker(
                    onChange: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            );
          },
        );
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateController,
          decoration: InputDecoration(
                labelText: "Fecha de publicación",
                hintText: widget.hintText ?? 'mm/dd/yy',
                labelStyle: TextStyle(color: morado),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: morado, width: 1)
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: morado, width: 1)
                ),
              ),
          validator: widget.validator,
        ),
      ),
    );
  }
}