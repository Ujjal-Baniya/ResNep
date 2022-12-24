import 'package:flutter/material.dart';

import 'package:resnep/models/load_Data.dart';
import '../models/seeModel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool showResult = false;
  TextEditingController symbolNo = TextEditingController();
  TextEditingController dob = TextEditingController();

  Future<List<seeData>> getData(symbolNumber, DOB) async {
    String url =
        "https://nepal-result.herokuapp.com/getResult?symbol=$symbolNumber&dob=$DOB";
    Response response = await get(Uri.parse(url));
    final List data = jsonDecode(response.body);
    return data.map((e) => seeData.fromJson(e)).toList();
  }

  var dataList;

  Widget customInputField(
      String txt, TextEditingController ctrl, TextInputType Tin, String label) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(6),
      //     border: Border.all(color: Colors.black)),
      child: TextFormField(
        keyboardType: Tin,
        controller: ctrl,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: txt,
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Colors.blueGrey[50],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            customInputField(
                "Symbol Number", symbolNo, TextInputType.name, "Symbol Number"),
            const SizedBox(
              height: 10,
            ),
            customInputField(
                "Dob (2062-01-08)", dob, TextInputType.number, "Date of Birth"),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  showResult = true;
                  // "00412105E", "2062-09-10"
                  dataList = getData(symbolNo.text, dob.text);
                });
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: const Text("View Result"),
            ),
            const SizedBox(
              height: 10,
            ),
            showResult == false
                ? const Text("")
                : test(dataList, symbolNo.text, dob.text),
          ],
        ),
      ),
    );
  }
}
