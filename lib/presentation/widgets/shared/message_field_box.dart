import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
            print('Button: $textValue');
            textController.clear();
          },),
      );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration, 
      onFieldSubmitted: (value) {
        textController.clear();
        print('Submit: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) => {
      //   print('Cambio: $value')
      // }
    );
  }
}