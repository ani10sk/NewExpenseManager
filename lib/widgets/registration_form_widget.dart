// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RegistrationFormWidget extends StatelessWidget {
  final String fieldName;
  final String textInputField;
  final bool isLastField;
  Function validatorFunction;
  Function setterFunc;

  RegistrationFormWidget(this.fieldName, this.setterFunc, this.textInputField,
      this.isLastField, this.validatorFunction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: TextFormField(
        decoration: InputDecoration(labelText: fieldName),
        onSaved: (value) => setterFunc(value.toString()),
        keyboardType: textInputField == "alpha"
            ? TextInputType.text
            : TextInputType.number,
        textInputAction:
            isLastField ? TextInputAction.done : TextInputAction.next,
        initialValue: "",
        validator: (value) => validatorFunction(value.toString()),
      ),
    );
  }
}
