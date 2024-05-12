import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? iconPrefix;
  final String? errorMessage;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText,
      this.iconPrefix});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        // borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(10));
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          prefixIcon: Icon(iconPrefix),
          enabledBorder: border,
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          focusColor: colors.primary,
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          errorText: errorMessage,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary))
          // suffixIcon: Icon(Icons.supervised_user_circle_outlined,
          //     color: colors.primary),
          ),
    );
  }
}
