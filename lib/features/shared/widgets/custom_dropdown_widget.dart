import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_entity.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({
    required this.onSelected,
    required this.quotaMaps,
    super.key,
  });

  final List<QuotaMapEntity> quotaMaps;
  final Function(QuotaMapEntity?) onSelected;

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  QuotaMapEntity? _selectedQuotaMaps;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<QuotaMapEntity>(
      decoration: InputDecoration(
        labelText: 'Seleciona um Mapa da quota',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        focusColor: ColorTheme.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: ColorTheme.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      value: _selectedQuotaMaps,
      items: widget.quotaMaps.map((QuotaMapEntity value) {
        return DropdownMenuItem<QuotaMapEntity>(
          value: value,
          child: Text(value.periodicity),
        );
      }).toList(),
      onChanged: (QuotaMapEntity? newValue) {
        setState(
          () {
            _selectedQuotaMaps = newValue;
            widget.onSelected(newValue);
          },
        );
      },
      validator: (value) {
        if (value == null) {
          return 'Porfavor seleciona um map de quota';
        }
        return null;
      },
    );
  }
}
