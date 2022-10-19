// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mail_tm_demo/utils/app_colors.dart';

class AppTextField extends StatefulWidget {
  String labelName;
  TextEditingController controller;
  bool obscureText;
  bool passShow;
  TextInputType inputType;
  bool enable;
  bool enableBorder;

  AppTextField(
      {Key? key,
        required this.labelName,
        required this.controller,
        this.obscureText = false,
        this.enableBorder=true,
        this.inputType = TextInputType.text,
        this.passShow = false,this.enable=true})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool passVisibility = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
          obscureText: widget.obscureText,
          keyboardType: widget.inputType,
          controller: widget.controller,
          enabled: widget.enable,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:  widget.enableBorder?const BorderSide(color: Colors.white, width: 0.5):const BorderSide(color: Colors.transparent, width: 0.0),
                //borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:  widget.enableBorder?const BorderSide(color: Colors.white, width: 0.5):const BorderSide(color: Colors.transparent, width: 0.0),
                //borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                // width: 0.0 produces a thin "hairline" border
                borderSide:  widget.enableBorder? BorderSide(color: Colors.white.withOpacity(.5), width: 0.5):const BorderSide(color: Colors.transparent, width: 0.0),
              ),
              filled: true,
              fillColor: AppColors.textFieldFillColor,
              label: Text(widget.labelName,style: const TextStyle(color: Colors.white70),),

              labelStyle: const TextStyle(fontSize: 14,color: Colors.white)),
        ),
        if (widget.passShow)
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 10),
              //child: Icon(Icons.visibility_outlined,color: Colors.black38,),
              child: InkWell(
                onTap: () {
                  setState(() {
                    passVisibility = !passVisibility;
                    widget.obscureText = passVisibility;
                  });
                },
                child: Icon(//visibility_outlined
                  passVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          )
      ],
    );
  }
}
