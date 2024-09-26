import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajar_state_management/model/item.dart';
import 'package:belajar_state_management/view model/item_provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);

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
          "Add Task",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Title",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
            child: TextField(
              controller: _subTitleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Sub Title",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0, right: 30, left: 30),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final item = Item(
                    title: _titleController.text,
                    subTitle: _subTitleController.text,
                    isCompleted: false,
                  );
                  itemProvider.addItem(item);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "ADD",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
