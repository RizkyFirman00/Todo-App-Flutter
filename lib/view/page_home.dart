import "package:belajar_state_management/view/page_add_item.dart";
import "package:belajar_state_management/view/widget_list_completed_item.dart";
import "package:belajar_state_management/view/widget_list_item.dart";
import "package:belajar_state_management/view%20model/item_provider.dart";
import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<ItemProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    String currentDate = DateFormat('d').format(DateTime.now());

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
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      currentDate,
                      style: const TextStyle(
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
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
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
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            // ALL ITEM PAGE
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: itemProvider.items.length,
                itemBuilder: (context, index) {
                  final item = itemProvider.items[index];
                  return ListItem(
                    item: itemProvider.items[index],
                    onDelete: () {
                      setState(
                        () {
                          itemProvider.deleteItem(index);
                        },
                      );
                    },
                    onToggle: () {
                      setState(
                        () {
                          itemProvider.toggleItemCompletion(item);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            // COMPLETED ITEM PAGE
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: itemProvider.completedItems.length,
                itemBuilder: (context, index) {
                  return ListCompletedItem(
                    item: itemProvider.completedItems[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
