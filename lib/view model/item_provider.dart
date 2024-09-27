import 'package:belajar_state_management/database/helper.dart';
import 'package:flutter/material.dart';
import 'package:belajar_state_management/model/item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> loadItems() async {
    _items = await _databaseHelper.getItems();
    notifyListeners();
  }

  Future<void> addItem(Item item) async {
    await _databaseHelper.insertItem(item);
    await loadItems();
  }

  Future<void> updateItem(Item item) async {
    await _databaseHelper.updateItem(item);
    await loadItems();
  }

  Future<void> deleteItem(int id) async {
    await _databaseHelper.deleteItem(id);
    await loadItems();
  }

  void toggleItemCompletion(Item item) async {
    item.isCompleted = !item.isCompleted;
    await updateItem(item);
  }

  List<Item> get completedItems =>
      _items.where((item) => item.isCompleted).toList();

  List<Item> get incompleteItems =>
      _items.where((item) => !item.isCompleted).toList();
}
