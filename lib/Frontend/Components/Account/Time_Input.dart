import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeInputField extends StatefulWidget {
  final String title;
  const TimeInputField({
    super.key,
    required this.title,
  });

  @override
  State<TimeInputField> createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () async {
        await _selectTime(context);
      },
      controller: TextEditingController(
        text: selectedTime != null
            ? DateFormat('hh:mm a').format(DateTime(1, 1, 1, selectedTime!.hour, selectedTime!.minute))
            : '',
      ),
      decoration: InputDecoration(
        hintText: widget.title,
        border: OutlineInputBorder(),
      ),
    );
  }
}