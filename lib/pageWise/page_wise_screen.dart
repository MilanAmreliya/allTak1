import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:khanakhjana/pageWise/api_handller.dart';

import 'data_model.dart';

class PageWiseApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagewiseListView<NewsGetModel>(
        pageSize: 20,

        pageFuture: (pageIndex) async {
          return [await API.apiGet()];
        },
        itemBuilder: (context, entry, index) {
          var user = entry.articles;
          return Container(
            height: 300,
            width: 400,
            child: ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 200,
                  child: ListTile(
                    title: Text("${user[index].author}"),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// FutureBuilder<NewsGetModel>(
// future: API.apiGet(),
// builder: (context, AsyncSnapshot<NewsGetModel> snapshot) {
// if (snapshot.connectionState == ConnectionState.done) {
// var user = snapshot.data.articles;
// return ListView.builder(
// itemBuilder: (context, index) {
// return Container(
// height: 50,
// width: double.infinity,
// child: ListTile(
// title: Text("${user[index].author}"),
// ),
// );
// },
// );
// } else {
// return Center(
// child: CircularProgressIndicator(),
// );
// }
// },
// ),
