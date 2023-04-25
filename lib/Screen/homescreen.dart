import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_tutorial/Model/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoApiModel> photolist = [];
  Future<List<PhotoApiModel>> getApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        photolist.add(PhotoApiModel.fromJson(i));
      }
      return photolist;
    } else {
      return photolist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text("Rest API'S"),
      )),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("Loading...");
              }
              return ListView.builder(
                itemCount: photolist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Title",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(photolist[index].title.toString()),
                              const SizedBox(
                                height: 10,
                              ),

                              // Text(photolist[index].title.toString()),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    photolist[index].albumId.toString()),
                              )
                            ]),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
