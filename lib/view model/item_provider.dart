import 'package:flutter/material.dart';
import 'package:belajar_state_management/model/item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];
  List<Item> get items => _items;

  List<Item> get completedItems =>
      _items.where((item) => item.isCompleted).toList();

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void updateItem(Item oldItem, Item newItem) {
    int index = _items.indexOf(oldItem);
    if (index != -1) {
      _items[index] = newItem;
      notifyListeners();
    }
  }

  void toggleItemCompletion(Item item) {
    item.isCompleted = !item.isCompleted;
    notifyListeners();
  }

  void deleteItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
