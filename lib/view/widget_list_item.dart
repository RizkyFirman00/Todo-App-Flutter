import 'package:belajar_state_management/view/page_edit_item.dart';
import 'package:belajar_state_management/model/item.dart';
import 'widget_confirmation_delete.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Item item;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const ListItem({
    Key? key,
    required this.item,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomConfirmationDialog(
          title: 'Delete Task',
          message: 'Just to confirm, do you really want to delete this task?',
          onConfirm: onDelete,
          onCancel: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Color(0xff9395D3),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    item.subTitle,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditItem(item: item)));
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 22,
                      color: Color(0xff9395D3),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _showDeleteConfirmation(context);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 22,
                      color: Color(0xff9395D3),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onToggle();
                    },
                    icon: item.isCompleted
                        ? const Icon(
                            Icons.check_circle,
                            size: 22,
                            color: Color(0xff9395D3),
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            size: 18,
                            color: Color(0xff9395D3),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
