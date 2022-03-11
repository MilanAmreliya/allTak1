import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khanakhjana/all_validation/utility.dart';

import 'common_widget_textfied.dart';

class TextCo extends StatefulWidget {
  @override
  _TextCoState createState() => _TextCoState();
}

class _TextCoState extends State<TextCo> {
  TextEditingController mobileNoTextEditingController;
  bool obbbdasd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          CommanWidget.getTextFormField(
            keyboardType: TextInputType.phone,
            labelText: "Enter your mobile number",
            textEditingController: mobileNoTextEditingController,
            inputLength: 10,
            regularExpression: Utility.digitsValidationPattern,
            validationMessage: Utility.mobileNumberInValidValidation,
            validationType: 'mobileno',
            hintText: "Enter Mobile No",
          ),
          CommanWidget.getTextFormField(
            obscureValue: obbbdasd,
            keyboardType: TextInputType.visiblePassword,
            regularExpression: Utility.digitsValidationPattern,

            hintText: 'passs',
            labelText: "Enter your mobile number",
            textEditingController: mobileNoTextEditingController,
            validationType: 'password',
            // regularExpression: Utility.digitsValidationPattern,
            inputLength: 10,
          ),
        ],
      ),
    );
  }
}
