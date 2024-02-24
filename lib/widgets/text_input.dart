import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String? errorText;
  final bool? isObscureText;
  final TextInputType textInputType;
  final String? Function(String?)? onChanged;
  const TextInput({
    super.key,
    required this.label,
    this.errorText,
    this.isObscureText,
    this.textInputType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText ?? false,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(label),
        errorText: errorText == "" ? null : errorText,
      ),
      onChanged: onChanged,
    );
  }
}
