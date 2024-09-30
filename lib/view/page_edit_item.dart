import 'package:belajar_state_management/model/item.dart';
import 'package:belajar_state_management/view%20model/item_provider.dart';
import 'package:belajar_state_management/view/widget_confirmation_delete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

class EditItem extends StatefulWidget {
  final Item item;

  const EditItem({
    super.key,
    required this.item,
  });

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.item.title;
    _subTitleController.text = widget.item.subTitle;
  }

  void _showDeleteConfirmation(BuildContext context, ItemProvider itemProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomConfirmationDialog(
          title: 'Delete Task',
          message: 'Just to confirm, do you really want to delete this task?',
          onConfirm: () {
            if (widget.item.id != null) {
              itemProvider.deleteItem(widget.item.id!);
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cannot delete item without ID')),
              );
            }
          },
          onCancel: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ItemProvider itemProvider =
        Provider.of<ItemProvider>(context, listen: false);
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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22.0, left: 30),
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _showDeleteConfirmation(context, itemProvider);
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22.0, right: 30),
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        final updatedItem = Item(
                          id: widget.item.id,
                          title: _titleController.text,
                          subTitle: _subTitleController.text,
                          isCompleted: widget.item.isCompleted,
                        );
                        if (widget.item.id != null) {
                          itemProvider.updateItem(updatedItem);
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cannot delete item without ID')),
                          );
                        }
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
