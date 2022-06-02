import 'package:flutter/material.dart';

import 'custom_form.dart';

class InputText extends StatefulWidget {
  final bool isRfc;
  final Widget? prefixIcon;
  final String? Function(String)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardtType;
  final String? labelText;
  const InputText({
    Key? key,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardtType,
    this.labelText,
    this.isRfc = false,
  }) : super(key: key);

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String? _errorText = '';
  late bool _obscureText;
  late CustomFormState? _formState;
  String? get errorText => _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formState = CustomForm.of(context);
      _formState?.register(this);
    });
  }

  @override
  void deactivate() {
    _formState?.remove(this);
    super.deactivate();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator!(text);
      setState(() {});
    }
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      textCapitalization: widget.isRfc
          ? TextCapitalization.characters
          : TextCapitalization.none,
      obscureText: _obscureText,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardtType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        suffixIcon: Icon(
          Icons.check_circle,
          color: _errorText == null ? Colors.teal : Colors.grey,
        ),
      ),
    );
  }
}
