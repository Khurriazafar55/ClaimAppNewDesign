import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldTheme1 {
  static const border_radius = BorderRadius.all(Radius.circular(5));
  static double border_width = 1;

  static Widget GetTextFormFieldWithBorder(
      context, title, controller, lableText, marginEdges,
      {keyboardType = TextInputType.text, focus_node, enabled = true}) {
    return Container(
      margin: marginEdges,
      // color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: ThemeColors.scaffold_color_lt,
              child: TextFormField(
                enabled: enabled,
                focusNode: focus_node,
                textAlign: TextAlign.left,
                controller: controller,
                style: const TextStyle(color: Colors.black),
                keyboardType: keyboardType,
                decoration: GetTextFormFieldDecorationWithBorder("$lableText"),
              )),
        ],
      ),
    );
  }

  static InputDecoration GetTextFormFieldDecorationWithBorder(hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      hintText: hintText,
      fillColor: ThemeColors.scaffold_color_lt,
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(2.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  static TextFormField GetTextFormField01(context, controller, lableText,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
        controller: controller,
        // style: Theme.of(context).textTheme.headline6,
        keyboardType: keyboardType,
        decoration: GetTextFormFieldDecoration01(
            context, controller, lableText, null, null, "Enter $lableText"));
  }

  static TextFormField GetTextFormField02(context, controller, lableText,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      decoration: GetTextFormFieldDecoration02(
          context, controller, lableText, null, null, "Enter $lableText"),
    );
  }

  static InputDecoration GetTextFormFieldDecorationOnlyBorder(hintText) {
    return InputDecoration(
      hintText: hintText,
      fillColor: Colors.black,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  static InputDecoration GetTextFormFieldDecoration02(
      context, controller, labelText, suffixIcon, prefixIcon, hintText) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      labelText: labelText,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      hintText: hintText,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: Theme.of(context).textTheme.headline6,
      hintStyle: Theme.of(context).textTheme.headline6,
      labelStyle: Theme.of(context).textTheme.headline6,
      floatingLabelStyle: Theme.of(context).textTheme.headline6,
    );
  }

  static InputDecoration GetTextFormFieldDecoration01(
      context, controller, labelText, suffixIcon, prefixIcon, hintText) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      labelText: null,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      hintText: hintText,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: Theme.of(context).textTheme.headline6,
      hintStyle: Theme.of(context).textTheme.headline6,
      labelStyle: Theme.of(context).textTheme.headline6,
      floatingLabelStyle: Theme.of(context).textTheme.headline6,
    );
  }
}
