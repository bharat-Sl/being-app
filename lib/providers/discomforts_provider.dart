import 'package:being/models/discomfort_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DiscomfortsProvider with ChangeNotifier {
  List<Discomfort> _allDiscomforts = [];
  List<Discomfort> _selectedDiscomforts = [];
  bool loading = false;

  List<Discomfort> get allDs => _allDiscomforts;
  List<Discomfort> get selectedDs => _selectedDiscomforts;

  void getAll() async {
    loading = true;
    _allDiscomforts = [];
    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection("Discomforts").get();
    data.docs.forEach((element) {
      _allDiscomforts.add(Discomfort.fromJson(element.data()));
    });
    loading = false;
    notifyListeners();
  }

  void select(Discomfort d) async {
    if (_selectedDiscomforts.contains(d)) {
      _selectedDiscomforts.remove(d);
    } else {
      _selectedDiscomforts.add(d);
    }
    notifyListeners();
  }
}
