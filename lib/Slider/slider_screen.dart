import 'package:flutter/material.dart';
import 'package:khanakhjana/Slider/slider_package.dart';

class SliderScreenn extends StatefulWidget {
  @override
  _SliderScreennState createState() => _SliderScreennState();
}

class _SliderScreennState extends State<SliderScreenn> {
  dynamic _value = 0.0;
  dynamic _valuue = 0;
  double _lowerValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            // FlutterSlider(
            //   values: [_lowerValue, _upperValue],
            //   max: 1000,
            //   min: 0,
            //   handlerHeight: 15,
            //   handlerWidth: 15,
            //   trackBar: FlutterSliderTrackBar(
            //       activeTrackBar: BoxDecoration(
            //     color: Color(0xffC1C4F5),
            //   )),
            //   handler: FlutterSliderHandler(
            //     decoration: BoxDecoration(
            //         color: Color(0xff424BE1), shape: BoxShape.circle),
            //     child: Text(""),
            //   ),
            //   tooltip: FlutterSliderTooltip(
            //       boxStyle: FlutterSliderTooltipBox(
            //           decoration: BoxDecoration(
            //         color: Colors.transparent,
            //       )),
            //       alwaysShowTooltip: true,
            //       // textStyle: ,
            //       rightSuffix: Text(
            //         " KM",
            //         style: TextStyle(fontSize: 40, color: Colors.black),
            //       ),
            //       textStyle: TextStyle(fontSize: 40, color: Colors.black),
            //       direction: FlutterSliderTooltipDirection.top),
            //   onDragging: (handlerIndex, lowerValue, upperValue) {
            //     setState(() {
            //       _lowerValue = lowerValue;
            //       _upperValue = upperValue;
            //     });
            //   },
            // ),
            /// CustomFlutterSlider edit package code
            CustomFlutterSlider(
              values: [_lowerValue],
              max: 1000,
              min: 0,
              handlerHeight: 15,
              handlerWidth: 15,
              trackBar: FlutterSliderTrackBar(
                  activeTrackBar: BoxDecoration(
                color: Color(0xffC1C4F5),
              )),
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(
                    color: Color(0xff424BE1), shape: BoxShape.circle),
                child: Text(""),
              ),
              tooltip: FlutterSliderTooltip(
                  boxStyle: FlutterSliderTooltipBox(
                      decoration: BoxDecoration(
                    color: Colors.transparent,
                  )),
                  alwaysShowTooltip: true,
                  // textStyle: ,
                  rightSuffix: Text(
                    " KM",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                  textStyle: TextStyle(fontSize: 40, color: Colors.black),
                  direction: FlutterSliderTooltipDirection.top),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(
                  () {
                    _lowerValue = lowerValue;
                    //_upperValue = upperValue;
                  },
                );
                print("====================================${_lowerValue}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
