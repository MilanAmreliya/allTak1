import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/Text_Filed_code/controller_textfiled.dart';
import 'package:khanakhjana/all_validation/utility.dart';

class CommanWidget {
  static ValidationController validationController =
      Get.put(ValidationController());
  static Widget getTextFormField(
      {String labelText,
      TextInputType keyboardType,
      TextEditingController textEditingController,
      bool isValidate,
      bool isEnable,
      String validationType,
      String regularExpression,
      int inputLength,
      String hintText,
      String validationMessage,
      String iconPath,
      int maxLine,
      Function obscureOnTap,
      IconData icon,
      bool obscureValue,
      Function onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style:
              TextStyle(color: Colors.deepPurple, fontSize: Get.height * 0.02),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Container(
          // height: 40,
          // color: Colors.lightGreen,
          child: Stack(
            children: [
              TextFormField(
                keyboardType: keyboardType,
                maxLines: maxLine == null ? 1 : maxLine,
                controller: textEditingController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(inputLength),
                  FilteringTextInputFormatter.allow(RegExp(regularExpression))
                ],
                enableInteractiveSelection: false,
                enabled: isEnable != null ? isEnable : true,
                validator: (value) {
                  print("isValidate  $isValidate}");
                  return isValidate == false
                      ? null
                      : value.isEmpty
                          ? validationMessage
                          : validationType == "email"
                              ? Utility.validateUserName(value)
                              : validationType == "password"
                                  ? Utility.validatePassword(value)
                                  : validationType == "mobileno"
                                      ? value.length != 10
                                          ? Utility
                                              .mobileNumberInValidValidation
                                          : null
                                      : null;
                },
                style: TextStyle(
                    color: isEnable != null ? Color(0xff707070) : Colors.black,
                    fontSize: Get.height * 0.02),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: outLineGrey,
                  enabledBorder: outLineGrey,
                  disabledBorder: outLineGrey,
                  isDense: true,
                  isCollapsed: true,
                  suffix: GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      icon,
                      size: Get.height * 0.02,
                      color: Colors.deepPurple,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                      top: Get.height * 0.013,
                      bottom: Get.height * 0.013,
                      left: Get.height * 0.019,
                      right: Get.height * 0.019),
                  errorBorder: outLineRed,
                  focusedErrorBorder: outLineRed,
                  hintText: hintText,
                ),
                obscureText:
                    validationType == 'password' ? obscureValue : false,
              ),
              validationType == 'password'
                  ? Positioned(
                      right: Get.height * 0.013,
                      top: Get.height * 0.01,
                      child: InkWell(
                        onTap: obscureOnTap,
                        child: Icon(
                          !validationController.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.deepPurple,
                          size: Get.height * 0.025,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.012,
        ),
      ],
    );
  }

  static InputBorder outLineGrey = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
  );
  static InputBorder outLineRed = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );

//   static getTextFormField(
//       {String labelText,
//       TextEditingController textEditingController,
//       bool isValidate,
//       bool isReadOnly = false,
//       bool isEnable,
//       TextInputType textInputType,
//       String validationType,
//       String regularExpression,
//       int inputLength,
//       String hintText,
//       String isIcon,
//       String validationMessage,
//       String iconPath,
//       int maxLine,
//       IconData icon,
//       Widget sIcon,
//       Function obscureOnTap,
//       bool obscureValue,
//       Function onTap}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           labelText,
//           style: TextStyle(color: Colors.deepPurple),
//         ),
//         labelText != ""
//             ? SizedBox(
//                 height: 10,
//               )
//             : SizedBox(),
//         Container(
//           // height: 40,
//           // color: Colors.lightGreen,
//           child: Stack(
//             children: [
//               TextFormField(
//                 readOnly: isReadOnly,
//                 showCursor: !isReadOnly,
//                 keyboardType: textInputType,
//                 onTap: onTap,
//                 maxLines: maxLine == null ? 1 : maxLine,
//                 controller: textEditingController,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(inputLength),
//                   FilteringTextInputFormatter.allow(RegExp(regularExpression)),
//                 ],
//                 enabled: isEnable != null ? isEnable : true,
//                 validator: (value) {
//                   print("isValidate  $isValidate}");
//                   return isValidate == false
//                       ? null
//                       : value.isEmpty
//                           ? validationMessage
//                           : validationType == "email"
//                               ? Utility.validateUserName(value)
//                               : validationType == "password"
//                                   ? Utility.validatePassword(value)
//                                   : validationType == "mobileno"
//                                       ? value.length != 10
//                                           ? Utility
//                                               .mobileNumberInValidValidation
//                                           : null
//                                       : null;
//                 },
//                 style: TextStyle(
//                     color: isEnable != null ? Colors.black : Colors.black,
//                     fontSize: 14),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 decoration: InputDecoration(
//                     focusedBorder: outLineGrey,
//                     enabledBorder: outLineGrey,
//                     isDense: true,
//                     isCollapsed: true,
//                     contentPadding:
//                         EdgeInsets.only(top: 15, bottom: 15, left: 10),
//                     errorBorder: outLineRed,
//                     focusedErrorBorder: outLineRed,
//                     hintText: hintText,
//                     suffixIcon: sIcon),
//                 obscureText:
//                     validationType == 'password' ? obscureValue : false,
//               ),
//               validationType == 'password'
//                   ? Positioned(
//                       right: Get.height * 0.02,
//                       top: Get.height * 0.018,
//                       child: InkWell(
//                         onTap: obscureOnTap,
//                         child: Icon(
//                           !obscureValue
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: Colors.grey,
//                           size: Get.height * 0.025,
//                         ),
//                       ),
//                     )
//                   : SizedBox(),
//             ],
//           ),
//         ),
//         labelText != ""
//             ? SizedBox(
//                 height: 10,
//               )
//             : SizedBox(),
//       ],
//     );
//   }
}
