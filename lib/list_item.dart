import 'package:belajar_state_management/edit_item.dart';
import 'package:belajar_state_management/model/item.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Item item;
  final VoidCallback onToggle;

  const ListItem({Key? key, required this.item, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      color: Color(0xff9395D3),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      decoration:
                          item.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    item.subTitle,
                    style: TextStyle(
                      fontSize: 10,
                      decoration:
                          item.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditItem()));
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: Color(0xff9395D3),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: Color(0xff9395D3),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      value:
                      item.isCompleted;
                      onToggle();
                    },
                    icon: Icon(
                      Icons.check_circle,
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
