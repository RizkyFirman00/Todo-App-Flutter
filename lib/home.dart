import "dart:ffi";
import "package:belajar_state_management/add_item.dart";
import "package:belajar_state_management/list_item.dart";
import "package:belajar_state_management/model/item.dart";
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> todoList = [
    Item(title: "Belajar Flutter", subTitle: "State management"),
    Item(title: "Maen game", subTitle: "Sampe jam 10 aja"),
    Item(title: "Tidur jam 12", subTitle: "Jangan maen hp"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6D7EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9395D3),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'TODO APP',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9395D3),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddItem()));
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListItem(
                item: todoList[index],
                onToggle: () {
                  setState(
                    () {
                      todoList[index].isCompleted =
                          !todoList[index].isCompleted;
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
