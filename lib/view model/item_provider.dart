import 'package:flutter/material.dart';
import 'package:belajar_state_management/model/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_logger/simple_logger.dart';

class ItemProvider with ChangeNotifier {
  final _logger = SimpleLogger();

  List<Item> _items = [];
  List<Item> get items => _items;

  String _errorFirebase = "";
  String get errorFirebase => _errorFirebase;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loadItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('items').get();
      _items = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Item.fromMap(data, doc.id);
      }).toList();
      notifyListeners();
    } catch (e) {
      _logger.info(e);
      _errorFirebase = e.toString();
    }
  }


  Future<void> addItem(Item item) async {
    try {
      DocumentReference docRef = _firestore.collection('items').doc();
      item.id = docRef.id;

      await docRef.set(item.toMap());
      // await _firestore.collection('items').add(item.toMap());
      loadItems();
    }
    catch(e){
      _logger.info(e);
      _errorFirebase = e.toString();
    }
  }

  Future<void> updateItem(Item item) async {
    _logger.info(item.id);
    try {
      await _firestore.collection('items').doc(item.id).update(item.toMap());
      loadItems();
    }
    catch(e){
      _logger.info(e);
      _errorFirebase = e.toString();
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _firestore.collection('items').doc(id).delete();
      loadItems();
    }
    catch(e){
      _logger.info(e);
      _errorFirebase = e.toString();
    }
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
