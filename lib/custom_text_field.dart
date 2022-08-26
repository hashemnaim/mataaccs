import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final Function? onSaved;
  final int? maxLine;
  final bool? isEnable;

  final TextInputType? textInputType;
  final String? textInitialValue;
  TextEditingController? textEditingController;
  final bool? confirmPass;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? password;
  final Function? validator;
  final bool? autofocus;
  final TextAlign? textAlign;
  final bool? isComment;

  CustomTextFormField(
      {this.hintText,
      this.onSaved,
      this.textInputType,
      this.isEnable = true,
      this.textEditingController,
      this.textInitialValue,
      this.suffixIcon,
      this.maxLine = 1,
      this.autofocus = false,
      this.textAlign,
      this.password = false,
      this.prefixIcon,
      this.validator,
      this.confirmPass = false,
      this.isComment = false});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool toggleEye = true;
  bool taped = false;
  FocusNode focusNode = FocusNode();
  Function? validator;

  fmToggleEye() {
    toggleEye = !toggleEye;
    setState(() {});
  }

  @override
  void initState() {
    focusNode.addListener(() {
      taped = focusNode.hasFocus;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.textInputType == TextInputType.phone
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              //To remove first '0'
              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
              // LengthLimitingTextInputFormatter(9)
            ]
          : [],
      style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "albayan"),
      initialValue: widget.textInitialValue,
      controller: widget.textEditingController,
      autofocus: widget.autofocus!,
      maxLines: widget.maxLine,
      textAlign: widget.textAlign ?? TextAlign.start,
      validator: (value) =>
          widget.confirmPass! ? widget.validator!(value) : validator!(value),
      onSaved: (newValue) => widget.onSaved!(newValue),
      onChanged: (value) {
        widget.onSaved!(value);
      },
      obscureText: widget.password! ? toggleEye : false,
      cursorColor: Colors.grey,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        enabled: widget.isEnable!,
        fillColor: const Color(0xFF171c27),
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        hintText: widget.hintText!.tr,
        hintStyle: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF888888),
            fontWeight: FontWeight.w500,
            height: 1.21,
            fontFamily: "albayan"),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            width: 1.0,
            color: const Color(0xFFFFFFFF).withOpacity(.1),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            width: 1.3,
            color: const Color(0xFF777777).withOpacity(.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            width: 1.0,
            color: Color(0xFFF6F6F7),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            width: 1.3,
            color: const Color(0xFF777777).withOpacity(.2),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            width: 1.0,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
