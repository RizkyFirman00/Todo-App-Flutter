import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  const EditItem({super.key});

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff9395D3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        title: const Text(
          "Edit Item",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      //       child: TextField(
      //         decoration: const InputDecoration(
      //           border: UnderlineInputBorder(),
      //           labelText: "Title",
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
      //       child: TextField(
      //         decoration: const InputDecoration(
      //           border: UnderlineInputBorder(),
      //           labelText: "Sub Title",
      //         ),
      //       ),
      //     ),
      //     Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(top: 22.0, right: 30, left: 30),
      //           child: SizedBox(
      //             height: 60,
      //             width: double.infinity,
      //             child: ElevatedButton(
      //               onPressed: () {},
      //               child: Text(
      //                 "ADD",
      //                 style: TextStyle(fontSize: 20),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 22.0, right: 30, left: 30),
      //           child: SizedBox(
      //             height: 60,
      //             width: double.infinity,
      //             child: ElevatedButton(
      //               onPressed: () {},
      //               child: Text(
      //                 "ADD",
      //                 style: TextStyle(fontSize: 20),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
