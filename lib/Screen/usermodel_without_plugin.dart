import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class WithoutPluginModel extends StatefulWidget {
  const WithoutPluginModel({super.key});

  @override
  State<WithoutPluginModel> createState() => _WithoutPluginModelState();
}

class _WithoutPluginModelState extends State<WithoutPluginModel> {
  TextEditingController searchcont = TextEditingController();
  String search = '';
  var data;
  Future<Void> userPlugin() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/2fc7f02b-dc89-4a94-b198-a8b323285e1d"));
    if (response.statusCode == 200) {
      return data = jsonDecode(response.body.toString());
    } else {
      return userPlugin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("User Plugin Model"))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: TextFormField(
              controller: searchcont,
              onChanged: ((value) {
                search = value;
                setState(() {});
              }),
              decoration: const InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          FutureBuilder(
            future: userPlugin(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final searchby = data[index]['name'].toString();
                      if (searchcont.text.isEmpty) {
                        return Card(
                          child: Column(children: [
                            Text(data[index]['id'].toString()),
                            ExtraRow(
                                value: data[index]['name'].toString(),
                                title: 'name'),
                            ExtraRow(
                                value:
                                    data[index]['address']['street'].toString(),
                                title: 'street'),
                            ExtraRow(
                                value:
                                    data[index]['address']['suite'].toString(),
                                title: 'suite'),
                            ExtraRow(
                                value:
                                    data[index]['address']['city'].toString(),
                                title: 'city'),
                            ExtraRow(
                                value: data[index]['address']['zipcode']
                                    .toString(),
                                title: 'zipcode'),
                            ExtraRow(
                                value: data[index]['address']['geo'].toString(),
                                title: 'geo'),
                            ExtraRow(
                                value: data[index]['address']['geo']['lat']
                                    .toString(),
                                title: 'lat'),
                            ExtraRow(
                                value: data[index]['address']['geo']['lng']
                                    .toString(),
                                title: 'lng'),
                          ]),
                        );
                      } else if (searchby
                          .contains(searchcont.text.toString())) {
                        return Card(
                          child: Column(children: [
                            Text(data[index]['id'].toString()),
                            ExtraRow(
                                value: data[index]['name'].toString(),
                                title: 'name'),
                            ExtraRow(
                                value:
                                    data[index]['address']['street'].toString(),
                                title: 'street'),
                            ExtraRow(
                                value:
                                    data[index]['address']['suite'].toString(),
                                title: 'suite'),
                            ExtraRow(
                                value:
                                    data[index]['address']['city'].toString(),
                                title: 'city'),
                            ExtraRow(
                                value: data[index]['address']['zipcode']
                                    .toString(),
                                title: 'zipcode'),
                            ExtraRow(
                                value: data[index]['address']['geo'].toString(),
                                title: 'geo'),
                            ExtraRow(
                                value: data[index]['address']['geo']['lat']
                                    .toString(),
                                title: 'lat'),
                            ExtraRow(
                                value: data[index]['address']['geo']['lng']
                                    .toString(),
                                title: 'lng'),
                          ]),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ExtraRow extends StatelessWidget {
  String title;

  String value;

  ExtraRow({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }
}
