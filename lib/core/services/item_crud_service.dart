import 'package:getxlightdarkmode/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ItemCrudService {
  final String _key = "items";

  Future<List<Item>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsString = prefs.getString(_key) ?? '[]';
    final List<dynamic> jsonList = jsonDecode(itemsString);
    return jsonList.map((json) => Item.fromJson(json)).toList();
  }

  Future<void> addItem(Item item) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await getItems();
    items.add(item);
    final itemsString = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_key, itemsString);
  }

  Future<void> updateItem(Item updatedItem) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await getItems();
    final index = items.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      items[index] = updatedItem;
      final itemsString =
          jsonEncode(items.map((item) => item.toJson()).toList());
      await prefs.setString(_key, itemsString);
    }
  }

  Future<void> deleteItem(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await getItems();
    items.removeWhere((item) => item.id == id);
    final itemsString = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_key, itemsString);
  }
}
