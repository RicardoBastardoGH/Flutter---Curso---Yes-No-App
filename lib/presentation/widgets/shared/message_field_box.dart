import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    // controller
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlinedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40), 
      borderSide: BorderSide(color: Colors.transparent));

    final inputDecoration =  InputDecoration(
        hintText: 'Escribe tu mensaje aquí',
        enabledBorder:outlinedInputBorder,
        focusedBorder:outlinedInputBorder,
        filled: true,
        // fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },),
      );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration, 
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      // onChanged: (value) => {
      //   print('Cambio: $value')
      // }
    );
  }
}