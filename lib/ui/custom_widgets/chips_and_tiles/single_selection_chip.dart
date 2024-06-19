import 'package:flutter/material.dart';

part 'single_selection_chip_mapper.dart';

class SingleSelectIconChip<T> extends StatelessWidget {
  final SingleSelectionModel<T> item;
  final bool isSelected;
  final double height;

  final ValueChanged<T> onTap;

  const SingleSelectIconChip(
    this.item, {
    required this.isSelected,
    required this.onTap,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            width: 1,
            color: isSelected ? Colors.grey : Colors.white,
          ),
        ),
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                if (item.leadingIcon != null) item.leadingIcon!,
                const SizedBox(width: 5),
                Expanded(child: Text(item.title)),
                isSelected
                    ? const Icon(Icons.check, size: 25)
                    : const SizedBox.shrink()
              ],
            ),
          ),
          onTap: () => onTap(item.object),
        ),
      ),
    );
  }
}
