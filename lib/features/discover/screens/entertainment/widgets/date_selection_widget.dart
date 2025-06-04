import 'package:vega_tokens/vega_tokens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({
    required this.title,
    required this.onSelectedDate,
    required this.validator,
    this.initialDate,
    super.key,
  });

  final String title;
  final DateTime? initialDate;
  final Function(DateTime? date) onSelectedDate;
  final String? Function(String?)? validator;

  @override
  State<DateSelectionWidget> createState() => DateSelectionWidgetState();
}

class DateSelectionWidgetState extends State<DateSelectionWidget> {
  final dateTextController = TextEditingController();

  @override
  void dispose() {
    dateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(widget.title),
        const SizedBox(width: VegaSizing.size2x),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 240,
          ),
          child: TextFormField(
            controller: dateTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
              errorMaxLines: 2,
            ),
            canRequestFocus: false,
            readOnly: true,
            validator: widget.validator,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: widget.initialDate ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                cancelText: 'CLEAR',
              );

              widget.onSelectedDate(date);
              dateTextController.text =
                  date != null ? DateFormat('dd/MM/yyyy').format(date) : '';
            },
          ),
        ),
      ],
    );
  }
}
