import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_tutorial/Model/user_model.dart';
import 'package:http/http.dart' as http;

class UserAPiModel extends StatefulWidget {
  const UserAPiModel({super.key});

  @override
  State<UserAPiModel> createState() => _UserAPiModelState();
}

class _UserAPiModelState extends State<UserAPiModel> {
  TextEditingController searchcont = TextEditingController();
  String search = '';
  List<UserModel> userlist = [];
  Future<List<UserModel>> userApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User APi Model")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: searchcont,
            onChanged: (val) {
              search = val;
              setState(() {});
            },
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey[200],
                filled: true,
                suffixIcon: const Icon(Icons.search),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: userApi(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: userlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      final searchby = snapshot.data![index].id.toString();
                      if (searchcont.text.isEmpty) {
                        return Card(
                          child: Column(
                            children: [
                              Text(
                                snapshot.data![index].id.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              ExtraRow(
                                value: snapshot.data![index].name.toString(),
                                icons: const Icon(Icons.person),
                                title: 'Name',
                              ),
                              ExtraRow(
                                value: snapshot.data![index].email.toString(),
                                icons: const Icon(Icons.email),
                                title: 'E-mail',
                              ),
                              ExtraRow(
                                value: snapshot.data![index].phone.toString(),
                                icons: const Icon(Icons.phone),
                                title: 'Phone No.',
                              )
                            ],
                          ),
                        );
                      } else if (searchby
                          .contains(searchcont.text.toString())) {
                        return Card(
                          child: Column(
                            children: [
                              Text(
                                snapshot.data![index].id.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              ExtraRow(
                                value: snapshot.data![index].name.toString(),
                                icons: const Icon(Icons.person),
                                title: 'Name',
                              ),
                              ExtraRow(
                                value: snapshot.data![index].email.toString(),
                                icons: const Icon(Icons.email),
                                title: 'E-mail',
                              ),
                              ExtraRow(
                                value: snapshot.data![index].phone.toString(),
                                icons: const Icon(Icons.phone),
                                title: 'Phone No.',
                              )
                            ],
                          ),
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
        ]),
      ),
    );
  }
}

class ExtraRow extends StatelessWidget {
  Icon icons;
  String title;
  String value;

  ExtraRow({
    super.key,
    required this.value,
    required this.icons,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 5,
          ),
          icons,
          const SizedBox(
            width: 10,
          ),
          Text(title),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }
}
