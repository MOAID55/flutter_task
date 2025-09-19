import 'package:flutter/material.dart';
import 'package:flutter_task1/models/category.dart';


class CategoryChip extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: category.isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: category.isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (category.isSelected)
              Icon(Icons.check,
                  size: 16, color: Theme.of(context).colorScheme.primary),
            if (category.isSelected) const SizedBox(width: 4),
            Text(
              category.name,
              style: TextStyle(
                color: category.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
