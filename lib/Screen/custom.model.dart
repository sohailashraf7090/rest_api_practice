import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomModel extends StatefulWidget {
  const CustomModel({super.key});

  @override
  State<CustomModel> createState() => _CustomModelState();
}

class _CustomModelState extends State<CustomModel> {
  List<Model> custmlist = [];
  Future<List<Model>> getApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        Model model = Model(
          title: i['title'],
          id: i['id'],
          completed: i['completed'],
        );
        custmlist.add(model);
      }
      return custmlist;
    } else {
      return custmlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Model Building")),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getApi(),
            builder: (context, AsyncSnapshot<List<Model>> snapshot) {
              print('future');
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: custmlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("list");
                    return Card(
                      
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ID:  ${snapshot.data![index].id}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data![index].title.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing:
                            Text(snapshot.data![index].completed.toString()),
                        leading: Icon(snapshot.data![index].completed == true
                            ? Icons.check_circle
                            : Icons.error_rounded),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}

class Model {
  String title;
  int id;
  bool completed;
  Model({
    required this.title,
    required this.id,
    required this.completed,
  });
}
