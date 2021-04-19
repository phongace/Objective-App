import 'package:flutter/material.dart';
import 'package:objective/models/target/target.dart';
import 'package:objective/services/target-service.dart';

class TargetProvider extends ChangeNotifier {
  List<Target> targets = [];

  Future<List<Target>> getTarget() async {
    var onValue = await TargetService.getTarget();
    targets = onValue;
    notifyListeners();
    return targets;
  }
}
