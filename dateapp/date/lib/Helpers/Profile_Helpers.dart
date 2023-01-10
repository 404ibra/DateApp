import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProfileHelpers {
  String? entrcypedName(String name, bool encrypt) {
    if (encrypt) {
      return name;
    }
    String enName = '';
    if (name.isEmpty) {
      return name;
    }
    final nameParts = name.split(" ");
    for (var currentNamePart in nameParts) {
      enName += (currentNamePart[0].characters.firstOrNull ?? "").toUpperCase();
      enName += "*" * (currentNamePart.length - 1);
      enName += " ";
    }
    enName = enName.trim();
    return enName;
  }
}
