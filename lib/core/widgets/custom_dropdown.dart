import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown<T> extends StatelessWidget {
  final Rxn<T> value;
  final List<T> items;
  final void Function(T?)? onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<T>(
        value: value.value,
        decoration: const InputDecoration(), 
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
              ),
            )
            .toList(),
        onChanged: (v) {
          value.value = v!;
          if (onChanged != null) onChanged!(v);
        },
      ),
    );
  }
}