import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/validators/form_validators.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({
    required this.formKey,
    required this.label,
    required this.name,
    this.customErrorText,
    this.customValidatorFunction,
    this.focusNode,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.initialValue,
    this.isEnabled = true,
    this.inputEmptyValidationText,
    this.inputFormatters,
    this.inputInvalidValidationText,
    this.isPasswordModeEnabled = false,
    this.isReadOnly = false,
    this.keyboardType,
    this.maxLength,
    this.onChange,
    this.onTap,
    this.prefixIcon,
    this.supportiveText,
    this.textEditingController,
    this.validatorMode,
    super.key,
  });

  final String? customErrorText;
  final String? Function(String?)? customValidatorFunction;
  final FocusNode? focusNode;
  final GlobalKey<FormBuilderState> formKey;
  final Icon? icon;
  final Color? iconColor;
  final double? iconSize;
  final String? initialValue;
  final bool isEnabled;
  final bool isPasswordModeEnabled;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final String label;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String name;
  final void Function(String?)? onChange;
  final void Function()? onTap;
  final Icon? prefixIcon;
  final String? supportiveText;
  final TextEditingController? textEditingController;
  final FormValidatorMode? validatorMode;
  final String? inputEmptyValidationText;
  final String? inputInvalidValidationText;

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool _isErrorState = false;
  bool _isFocusState = false;
  TextEditingController? _textEditingController;
  late FocusNode _focusNode;
  late IconData _iconEye;
  late bool _obscureText;

  Widget? get icon {
    if (widget.isPasswordModeEnabled) {
      return IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
            _iconEye = _obscureText ? Icons.visibility : Icons.visibility_off;
          });
        },
        icon: Icon(
          _iconEye,
          color: widget.iconColor,
        ),
      );
    }
    if (_isErrorState) {
      return const SizedBox(
        height: 20,
        child: Icon(
          Icons.info,
          color: ColorTheme.errorColor,
        ),
      );
    }
    if (widget.icon != null) {
      return SizedBox(
        height: widget.iconSize ?? 16,
        child: widget.icon,
      );
    }
    return null;
  }

  Widget? get prefixIcon {
    return widget.prefixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
            ),
            child: widget.prefixIcon,
          )
        : null;
  }

  // Just one of the validation methods can be used. It needs to be either the
  // custom validation function, or the built-in validation. If both are used,
  // it'll return null.
  String? _getValidator(String? text) {
    if (widget.customValidatorFunction == null) {
      if (widget.validatorMode == null) {
        return null;
      }
      return FormValidator.validate(
        type: widget.validatorMode,
        text: text,
        inputInvalidText: widget.inputInvalidValidationText,
        inputEmptyText: widget.inputEmptyValidationText,
      );
    }
    return widget.validatorMode == null
        ? widget.customValidatorFunction!(text)
        : null;
  }

  void _onFocusChange() {
    setState(() {
      _isFocusState = _focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    _obscureText = widget.isPasswordModeEnabled;
    _iconEye = Icons.visibility;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _textEditingController = widget.textEditingController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: widget.initialValue,
      name: widget.name,
      maxLength: widget.maxLength,
      focusNode: _focusNode,
      controller: _textEditingController,
      enabled: widget.isEnabled,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      inputFormatters: widget.inputFormatters ?? <TextInputFormatter>[],
      decoration: InputDecoration(
        label: Text(widget.label),
        helperText: widget.supportiveText,
        prefixIconConstraints: const BoxConstraints.tightFor(
          width: 48,
          height: 48,
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(
          width: 48,
        ),
        filled: widget.isEnabled ? null : true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme.primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        errorText: widget.customErrorText,
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        errorMaxLines: 3,
        prefixIcon: prefixIcon,
        suffixIcon: icon,
      ),
      onChanged: (String? value) {
        widget.formKey.currentState?.fields[widget.name]?.validate();
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      onTapOutside: (PointerDownEvent event) {
        _focusNode.unfocus();
      },
      validator: (String? value) {
        final String? error = _getValidator(value);
        setState(() {
          _isErrorState = error != null && !_isFocusState;
        });
        if (_isErrorState) {
          return error;
        } else {
          return null;
        }
      },
    );
  }

  @override
  void dispose() {
    if (_textEditingController != null) {
      _textEditingController!.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }
}
