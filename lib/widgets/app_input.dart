import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/core/enums.dart';

class AppInput extends StatefulWidget {
  final String placeholder;
  final String label;
  final AppInputType type;
  final bool visibility;
  final String? initialValue;
  final bool showHelp;
  final VoidCallback? onHelpPress;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AppInput({
    super.key,
    this.placeholder = 'placeholder',
    this.label = 'label',
    this.type = AppInputType.text,
    this.visibility = true,
    this.initialValue,
    this.showHelp = false,
    this.controller,
    this.onHelpPress,
    this.validator,
  });

  @override
  State<AppInput> createState() => _InputState();
}

class _InputState extends State<AppInput> {
  late bool _isHidden;
  TextEditingController? _internalController;

  TextEditingController get _effectiveController =>
      widget.controller ??
      (_internalController ??= TextEditingController(
        text: widget.initialValue,
      ));
  @override
  void initState() {
    super.initState();
    _isHidden = widget.visibility;
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.initialValue);
    }
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case AppInputType.email:
        return TextInputType.emailAddress;
      case AppInputType.phone:
        return TextInputType.phone;
      case AppInputType.number:
        return TextInputType.number;
      case AppInputType.date:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.md.copyWith(color: Colors.black, height: 1.0),
        ),
        SizedBox(height: 12),
        TextFormField(
          validator: widget.validator,
          controller: _effectiveController,
          obscureText: _isHidden && widget.type == AppInputType.password,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyles.md.copyWith(color: Colors.black),
          keyboardType: _getKeyboardType(),
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
            isDense: true,
            filled: true,
            fillColor: AppColors.inputsBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            hintText: widget.placeholder,
            hintStyle: AppTextStyles.md.copyWith(
              color: AppColors.textPlaceholders,
            ),
            contentPadding: EdgeInsets.all(10.0),
            suffixIcon: widget.type == AppInputType.password
                ? IconButton(
                    icon: Icon(
                      _isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                  )
                : null,
          ),
        ),
        Visibility(
          visible: widget.showHelp,
          child: Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                SizedBox(height: 9),
                TextButton(
                  onPressed: widget.onHelpPress ?? () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Forget Password',
                    style: AppTextStyles.sm.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
