import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NebResult extends StatefulWidget {
  const NebResult({Key? key}) : super(key: key);

  @override
  State<NebResult> createState() => _NebResultState();
}

class _NebResultState extends State<NebResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      child: const Center(child: Text("NEB RESULT COMING SOON")),
    );
  }
}
