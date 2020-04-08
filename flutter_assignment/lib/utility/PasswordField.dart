import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget{
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.textController
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldSetter<String> onChanged;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController textController;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 16),
      controller: widget.textController,
      onChanged: widget.onChanged,
      key: widget.fieldKey,
      obscureText: _obscureText,  // if not provided by the user, then it is 8
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
        errorStyle: TextStyle(color: Colors.white70),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.blue,),
        ),
      ),
    );
  }

}