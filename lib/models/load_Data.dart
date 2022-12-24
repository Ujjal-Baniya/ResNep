import 'package:flutter/material.dart';
import '../models/seeModel.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class test extends StatelessWidget {
  ScreenshotController finalScreenshot = ScreenshotController();
  final Future<List<seeData>> finalList;
  final String symbolNum;
  final String ObtainedGrade;
  test(this.finalList, this.symbolNum, this.ObtainedGrade);
  @override
  Widget build(BuildContext context) {
    final List<String> ColumnHeaders = [
      "Subjects",
      "Credit Hours",
      "TH",
      "PR",
      "Final Grade",
      "Grade Point"
    ];

    TextStyle s() {
      return const TextStyle(
        fontSize: 25,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      );
    }

    getDataCell(seeData? data) {
      return [
        DataCell(Text(
          data?.sub as String,
          style: s(),
        )),
        DataCell(Text(data?.credit_hours as String, style: s())),
        DataCell(Text(data?.Theoritical as String, style: s())),
        DataCell(Text(data?.practical as String, style: s())),
        DataCell(Text(data?.final_grade as String, style: s())),
        DataCell(Text(data?.grade_point as String, style: s())),
      ];
    }

    return FutureBuilder<List<seeData>>(
        initialData: const [],
        future: finalList,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Screenshot(
                    controller: finalScreenshot,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Symbol Number: "),
                              Text(
                                symbolNum,
                                style: Theme.of(context).textTheme.headline2,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text("Date of Birth: "),
                              Text(
                                ObtainedGrade,
                                style: Theme.of(context).textTheme.headline2,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: DataTable(
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                              ),
                              dividerThickness: 5,
                              columns: ColumnHeaders.map((head) {
                                return DataColumn(
                                    label: Text(
                                  head,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ));
                              }).toList(),
                              rows: [
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[0],
                                  ),
                                ),
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[1],
                                  ),
                                ),
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[2],
                                  ),
                                ),
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[3],
                                  ),
                                ),
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[4],
                                  ),
                                ),
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[5],
                                  ),
                                ),
                                DataRow(
                                  cells: getDataCell(
                                    snapshot.data?[6],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final directory =
                          (await getExternalStorageDirectory())!.path;
                      finalScreenshot.captureAndSave(
                        directory,
                        fileName: "$symbolNum.png",
                      );
                      final storageRef = FirebaseStorage.instance.ref();
                      final folderName = FirebaseAuth.instance.currentUser!.uid;
                      final userref = storageRef.child("$folderName");
                      final fileref = userref.child("$symbolNum.png");
                      final File file = File("$directory/$symbolNum.png");
                      try {
                        await fileref.putFile(file);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text("Save Result"),
                  ),
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });
  }
}
