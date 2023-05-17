import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/constants/colors.dart';
import 'package:savana/viewmodel/words_viewmodel.dart';

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
  final _formKey = GlobalKey<FormState>();

  void send(String text) {
    if (_formKey.currentState!.validate()) {
      widget.onSend(text.trim());
      controller.clear();
      setState(() {
        currentText = "";
      });
    }
  }

  String? validate(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Adicione uma palavra';
    }
    if (ref.read(wordsViewModel).getAllWordsFromPool().contains(text)) {
      return "Outro jogador já escolheu essa palavra";
    }
    if (ref.read(wordsViewModel).getPlayerWords().contains(text)) {
      return "Não repita palavras";
    }
    if (text.length < 2) {
      return "Escreva mais de uma letra";
    }
    if (text.length > 16) {
      return "Utilize até 16 letras";
    }
    if (RegExp(r'[^a-zA-Z\-\ à-ùÀ-Ù]').firstMatch(text) != null) {
      return "Utilize apenas letras";
    }
    return null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: TextFormField(
                validator: validate,
                controller: controller,
                style: Theme.of(context).textTheme.bodyMedium,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    suffixIconColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        send(currentText);
                      },
                    ),
                    filled: true,
                    fillColor: componentColor,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    errorStyle: const TextStyle(
                        fontSize: 24, fontFamily: "MouseMemoirs", color: errorColor)),
                onFieldSubmitted: (text) => send(text),
                onEditingComplete: () {},
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
      ),
    );
  }
}
