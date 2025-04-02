import 'package:flutter/material.dart';
import 'package:spookify_v2/src/presentation/theme/app_colors.dart';
import 'package:spookify_v2/src/presentation/theme/spookify_theme.dart';

class HeaderElevatedButton extends StatefulWidget {
  final List<String> text;
  final int startedIndex;
  final Function(String) onPressed;

  const HeaderElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.startedIndex,
  });

  @override
  State<HeaderElevatedButton> createState() => _HeaderElevatedButtonState();
}

class _HeaderElevatedButtonState extends State<HeaderElevatedButton> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.startedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.text.length, (index) {
        bool isSelected = selectedIndex == index;
        final textColor = isSelected ? Colors.black : Colors.white;
        final backgroundColor = isSelected
            ? AppColors.primary
            : Theme.of(context).colorScheme.surface;

        return Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ElevatedButton(
            style: SpookifyTheme.elevatedButtonStyle(
              textColor: textColor,
              type: ElevatedButtonType.appbar,
              backgroundColor: backgroundColor,
            ),
            onPressed: () {
              widget.onPressed(widget.text[index]);
              setState(() {
                selectedIndex = index;
              });
            },
            child: Text(
              widget.text[index],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        );
      }),
    );
  }
}
