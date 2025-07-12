
import 'package:flutter/material.dart';
import '../config/constants.dart';

class FilterChips extends StatelessWidget {
  final List<String> options;
  final Set<String> selected;
  final ValueChanged<Set<String>> onSelectionChanged;

  const FilterChips({
    Key? key,
    required this.options,
    required this.selected,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) => Wrap(
    spacing: 8,
    children: options.map((opt) {
      final isSel = selected.contains(opt);
      return ChoiceChip(
        label: Text(opt),
        selected: isSel,
        selectedColor: AppColors.accent,
        backgroundColor: AppColors.background,
        labelStyle: TextStyle(
          color: isSel ? Colors.white : AppColors.textPrimary,
        ),
        onSelected: (sel) {
          final newSet = Set<String>.from(selected);
          if (sel) newSet.add(opt); else newSet.remove(opt);
          onSelectionChanged(newSet);
        },
      );
    }).toList(),
  );
}
