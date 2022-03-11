import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/octo_image/size_octo_image.dart';
import 'package:octo_image/octo_image.dart';

class OctoImageDemo extends StatefulWidget {
  @override
  _OctoImageDemoState createState() => _OctoImageDemoState();
}

class _OctoImageDemoState extends State<OctoImageDemo> {
  double getProportionateScreenHeight(double inputHeight) {
    // 812 is the layout height that designer use
    // print(
    //     "HEIGHT ${(inputHeight / 812.0) * Get.height} ${inputHeight} ${Get.height}");
    return (inputHeight / 812.0) * Get.height;
  }

// Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    // 375 is the lay  print("WIDTH ${(inputWidth / 375.0) * Get.width} ${inputWidth} ${Get.width}");out width that designer use
    return (inputWidth / 375.0) * Get.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: commonProfileOctoImage(
            fit: true,
            height: 300,
            width: 400,
            circleShape: true,
            image:
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fb%2Fb6%2FImage_created_with_a_mobile_phone.png%2F1200px-Image_created_with_a_mobile_phone.png&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&tbnid=gxFxsvFBmxeZ9M&vet=12ahUKEwjSvpmtmJ_zAhX2n0sFHdIsB_UQMygAegUIARDTAQ..i&docid=0JWe7yDOKrVFAM&w=1200&h=900&q=image&ved=2ahUKEwjSvpmtmJ_zAhX2n0sFHdIsB_UQMygAegUIARDTAQ'),
      ),
    );
  }
}

Widget commonProfileOctoImage(
    {String image,
    double height,
    double width,
    bool circleShape = true,
    bool fit = false}) {
  String url = "https://vid-mates.com/abir/beauty-app4/public/";
  return OctoImage(
    image: NetworkImage(
        'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fb%2Fb6%2FImage_created_with_a_mobile_phone.png%2F1200px-Image_created_with_a_mobile_phone.png&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&tbnid=gxFxsvFBmxeZ9M&vet=12ahUKEwjSvpmtmJ_zAhX2n0sFHdIsB_UQMygAegUIARDTAQ..i&docid=0JWe7yDOKrVFAM&w=1200&h=900&q=image&ved=2ahUKEwjSvpmtmJ_zAhX2n0sFHdIsB_UQMygAegUIARDTAQ'),
    imageBuilder: (context, child) {
      return circleShape
          ? CircleAvatar(
              backgroundImage: NetworkImage(image),
            )
          : Container(
              height: getProportionateScreenHeight(812),
              width: getProportionateScreenWidth(450),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: fit ? BoxFit.cover : BoxFit.contain),
              ),
            );
    },
    placeholderBuilder: OctoPlaceholder.blurHash(
      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
    ),
    /* progressIndicatorBuilder: (context, progress) {
      double value;
      if (progress != null && progress.expectedTotalBytes != null) {
        value = progress.cumulativeBytesLoaded / progress.expectedTotalBytes;
      }
      return CircularProgressIndicator(value: value);
    },*/
    errorBuilder: (context, error, stackTrace) {
      return Center(
        child: Image.network(
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fb%2Fb6%2FImage_created_with_a_mobile_phone.png%2F1200px-Image_created_with_a_mobile_phone.png&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&tbnid=gxFxsvFBmxeZ9M&vet=12ahUKEwjSvpmtmJ_zAhX2n0sFHdIsB_UQMygAegUIARDTAQ..i&docid=0JWe7yDOKrVFAM&w=1200&h=900&q=image&ved=2ahUKEwjSvpmtmJ_zAhX2n0sFHdIsB_UQMygAegUIARDTAQ'),
      );
    },
    // errorBuilder: OctoError.icon(color: Colors.grey),
    fit: BoxFit.contain,
    height: height,
    width: width,
  );
}
