import 'package:flutter/material.dart';

class TextFormFieldTheme {
  static final border_radius = BorderRadius.all(Radius.circular(5));
  static double border_width = 1;

  static Widget GetTextFormFieldWithBorder(
      context, title, _controller, lable_text, margin_edges,
      {keyboardType = TextInputType.text, focus_node = null, enabled = true}) {
    return Container(
      margin: margin_edges,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title", style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 5),
          TextFormField(
            enabled: enabled,
            focusNode: focus_node,
            textAlign: TextAlign.left,
            controller: _controller,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: keyboardType,
            decoration: GetTextFormFieldDecorationWithBorder("$lable_text"),
          )
        ],
      ),
    );
  }

  static InputDecoration GetTextFormFieldDecorationWithBorder(hint_text) {
    return InputDecoration(
      contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
      hintText: hint_text,
      fillColor: Colors.transparent,
      focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          // borderSide: BorderSide.none,
          ),
      enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          // borderSide: BorderSide.none,
          ),
    );
  }

  static TextFormField GetTextFormField01(context, _controller, lable_text,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
        controller: _controller,
        style: Theme.of(context).textTheme.headline6,
        keyboardType: keyboardType,
        decoration: GetTextFormFieldDecoration01(
            context, _controller, lable_text, null, null, "Enter $lable_text"));
  }

  static TextFormField GetTextFormField02(context, _controller, lable_text,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      decoration: GetTextFormFieldDecoration02(
          context, _controller, lable_text, null, null, "Enter $lable_text"),
    );
  }

  static InputDecoration GetTextFormFieldDecorationOnlyBorder(hint_text) {
    return InputDecoration(
      hintText: hint_text,
      fillColor: Colors.transparent,
      focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          // borderSide: BorderSide.none,
          ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  static InputDecoration GetTextFormFieldDecoration02(
      context, _controller, labelText, suffixIcon, prefixIcon, hintText) {
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
      context, _controller, labelText, suffixIcon, prefixIcon, hintText) {
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
