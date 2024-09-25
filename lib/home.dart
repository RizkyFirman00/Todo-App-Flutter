import "dart:ffi";

import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6D7EF),
      appBar: AppBar(
        backgroundColor: Color(0xFF9395D3),
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
        backgroundColor: Color(0xFF9395D3),
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        child: Container(),
      ),
    );
  }
}
