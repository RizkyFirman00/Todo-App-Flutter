import 'package:belajar_state_management/database/helper.dart';
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
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    super.dispose();
  }

  void _clearInputs() {
    _titleController.clear();
    _subTitleController.clear();
  }

  void _addItem(BuildContext context) {
    String title = _titleController.text;
    String subTitle = _subTitleController.text;

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title cannot be empty')),
      );
      return;
    }

    if (subTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sub Title cannot be empty')),
      );
      return;
    }

    final newItem = Item(title: title, subTitle: subTitle);
    Provider.of<ItemProvider>(context, listen: false).addItem(newItem);
    Navigator.of(context).pop();
    _clearInputs();
  }

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
                onPressed: () => _addItem(context),
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
