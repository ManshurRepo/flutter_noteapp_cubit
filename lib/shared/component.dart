import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget CustomTextFormField(
        {required TextEditingController? controller,
        ValueChanged<String>? submit,
        required TextInputType? keyboardType,
        required FormFieldValidator<String>? validator,
        required String label,
        required IconData prefixIcon,
        required String hintText,
        GestureTapCallback? onTap,
        int? lines}) =>
    TextFormField(
      maxLines: lines,
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: submit,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          isDense: true,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      validator: validator,
    );
