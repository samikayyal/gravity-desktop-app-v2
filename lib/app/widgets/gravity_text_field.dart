import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GravityTextField extends StatefulWidget {
  const GravityTextField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.suffixText,
  }) : isMoney = false,
       isBlind = false,
       revealTooltip = null,
       hideTooltip = null;

  const GravityTextField.blind({
    super.key,
    required this.label,
    required this.revealTooltip,
    required this.hideTooltip,
    this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.suffixText,
  }) : isMoney = false,
       isBlind = true;

  const GravityTextField.money({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.autofocus = false,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.suffixText,
  }) : keyboardType = TextInputType.number,
       textAlign = TextAlign.end,
       isMoney = true,
       isBlind = false,
       revealTooltip = null,
       hideTooltip = null;

  const GravityTextField.blindMoney({
    super.key,
    required this.label,
    required this.revealTooltip,
    required this.hideTooltip,
    this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.autofocus = false,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.suffixText,
  }) : keyboardType = TextInputType.number,
       textAlign = TextAlign.end,
       isMoney = true,
       isBlind = true;

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final bool isMoney;
  final bool isBlind;
  final String? revealTooltip;
  final String? hideTooltip;
  final String? suffixText;

  @override
  State<GravityTextField> createState() => _GravityTextFieldState();
}

class _GravityTextFieldState extends State<GravityTextField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = widget.isMoney
        ? theme.dataTableTheme.dataTextStyle?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
          )
        : theme.textTheme.bodyMedium;

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.inputFormatters,
      textAlign: widget.textAlign,
      style: textStyle,
      obscureText: widget.isBlind && _isHidden,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        suffixText: widget.suffixText,
        suffixIcon: widget.isBlind ? _buildRevealButton() : null,
      ),
    );
  }

  Widget _buildRevealButton() {
    final isHidden = _isHidden;
    return IconButton(
      tooltip: isHidden ? widget.revealTooltip : widget.hideTooltip,
      icon: Icon(
        isHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        size: 20,
      ),
      onPressed: widget.enabled
          ? () {
              setState(() {
                _isHidden = !_isHidden;
              });
            }
          : null,
    );
  }
}
