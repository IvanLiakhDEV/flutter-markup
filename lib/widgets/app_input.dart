import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/core/enums.dart';

class AppInput extends StatefulWidget {
  final String placeholder;
  final String label;
  final AppInputType type;
  final bool visibility;
  const AppInput({
    super.key,
    this.placeholder = 'placeholder',
    this.label = 'label',
    this.type = AppInputType.text,
    this.visibility = false,
  });

  @override
  State<AppInput> createState() => _InputState();
}

class _InputState extends State<AppInput> {
  late bool _isHidden;
  @override
  void initState() {
    super.initState();
    _isHidden = widget.visibility;
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
        TextField(
          obscureText: _isHidden && widget.type == AppInputType.password,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyles.md.copyWith(color: AppColors.textPlaceholders),
          keyboardType: _getKeyboardType(),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.inputsBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
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
          visible: widget.visibility && widget.type == AppInputType.password,
          child: Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                SizedBox(height: 9),
                TextButton(
                  onPressed: () => print('Pressed'),
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
