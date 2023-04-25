import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/complexmodel.dart';

class ComplexApiModel extends StatefulWidget {
  const ComplexApiModel({super.key});

  @override
  State<ComplexApiModel> createState() => _ComplexApiModelState();
}

class _ComplexApiModelState extends State<ComplexApiModel> {
  Future<VeryComplexModel> complexApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/2fc7f02b-dc89-4a94-b198-a8b323285e1d"));
    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      return VeryComplexModel.fromJson(data);
    } else {
      return VeryComplexModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complex Json Model")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<VeryComplexModel>(
                future: complexApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: const BoxDecoration(),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(snapshot
                                                  .data!
                                                  .data![index]
                                                  .images![position]
                                                  .url
                                                  .toString()))),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
