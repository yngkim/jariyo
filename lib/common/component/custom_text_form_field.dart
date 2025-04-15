import 'package:jariyo/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  //외부 정의 파라미터 목록
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final void Function(String)? onChanged;
  final InputDecoration? decoration;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1,
      ),
    );
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: decoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: BODY_TEXT_COLOR,
              fontSize: 14,
            ),
            errorText: errorText,
            fillColor: INPUT_BG_COLOR,
            filled: true,
            //모든 input 상태의 기본 스타일 세팅
            border: baseBorder,
            //선택되지 않은 박스는 테두리 비활성화
            enabledBorder: baseBorder,
            //copyWith 사용법@@
            focusedBorder: baseBorder.copyWith(
                borderSide: baseBorder.borderSide.copyWith(
              color: PRIMARY_COLOR,
            )),
          ),
    );
  }
}
