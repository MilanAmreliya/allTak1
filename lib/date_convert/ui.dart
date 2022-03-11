import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:khanakhjana/date_convert/api_repo.dart';

import 'date_formet_repo.dart';

class DateUi extends StatefulWidget {
  @override
  _DateUiState createState() => _DateUiState();
}

class _DateUiState extends State<DateUi> {
  List milm = [
    '2019-04-05T14:00:51.000Z',
    '2019-05-05T14:00:51.000Z',
    '2019-06-05T14:00:51.000Z',
    '2019-07-05T14:00:51.000Z',
    '2019-08-05T14:00:51.000Z',
    '2019-09-05T14:00:51.000Z'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<DateFoemetResponse>>(
          future: ApiDate().dateFo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // milm.forEach((subelement) {
              //   var sfdffd =
              //       subelement.substring(0, subelement.lastIndexOf(' '));
              //   print('---------dsdsdd-----$sfdffd');
              // });
              snapshot.data.forEach((element) {
                // print(
                //     '------run--type---------${element.orderedDate.runtimeType}');
                // var str = "2019-04-05T14:00:51.000Z";
                // var newStr = str.substring(0, 10) + ' ' + str.substring(11, 23);
                // print(newStr); // 2019-04-05 14:00:51.000
                // DateTime dt = DateTime.parse(newStr);
                // print(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt));
                // var date = df.parse(course.date); String rt = df.format(date);

                var fname = element.orderedDate.toString().substring(
                    0, element.orderedDate.toString().lastIndexOf(' '));

                String lname = element.orderedDate.toString().substring(
                    element.orderedDate.toString().lastIndexOf(' ') + 1);
                // print('---------date--con--fname---$fname');
                // print('---------date--con--lname---$lname');
                var a = Jiffy("$fname").yMMMMd; // October 18, 2019
                // print('---------monthe ----convert--------$a');
                var now = new DateTime.now();
                DateTime mmmmmmm = DateTime.parse('$fname');
                DateTime dateTimeNow =
                    DateTime(now.year, now.month - 6, now.day);


                // var newDateee =
                //     new DateTime(mmmmmmm.year, mmmmmmm.month - 1, mmmmmmm.day);
                // print('------------snapshot-6-------$newDateee');
                print(DateTime(now.year, now.month - 6, now.day));
                var newDate = new DateTime(now.year, now.month, now.day - 11);
                print('------------datetime-6-------$newDate');

                if (element.orderedDate.difference(newDate).inDays > -1) {
                  print('---------andarrrr-------${element.orderedDate}');
                }

                // milm.forEach((element) {
                //   if (DateTime(now.year, now.month - 6, now.day)
                //       .isBefore(element)) {
                //     print('---------hxbhhbch-------${element}');
                //   }
                // });
                // milm.forEach((element) {
                //   if (mmmm222.month - 6 < mmmmmmm.month) {
                //     print('---filter---last---six----$element');
                //   }
                // });
              });
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Text('${snapshot.data[index].orderedDate}');
                    },
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
