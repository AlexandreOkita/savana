import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/constants/colors.dart';

class WriteWordField extends ConsumerStatefulWidget {
  final String title;
  final String detail;
  final void Function(String) onSend;

  const WriteWordField({
    required this.title,
    required this.detail,
    required this.onSend,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WriteWordFieldState();
}

class _WriteWordFieldState extends ConsumerState<WriteWordField> {
  String currentText = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: TextField(
              controller: controller,
              style: Theme.of(context).textTheme.bodyMedium,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                suffixIconColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    widget.onSend(currentText);
                    controller.clear();
                  },
                ),
                filled: true,
                fillColor: componentColor,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onChanged: (text) => setState(() {
                currentText = text;
              }),
            ),
          ),
        ),
        Text(
          widget.detail,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
