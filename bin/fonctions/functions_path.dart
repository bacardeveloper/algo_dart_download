// ignore_for_file: non_constant_identifier_names

import 'dart:io';

String pathOrigine() {
  var chemin_courant = Directory.current;
  var cheminCourantString = chemin_courant.toString();
  return cheminCourantString;
}

String recuperer_letter(String data) {
  var splitPath = data.split(r'\');

  int users = 3;
  List path_composer = [];
  for (int i = 0; i < users; i++) {
    path_composer.add(splitPath[i]);
  }
  var disk_letter = path_composer[0].split(':');
  var letter = disk_letter[1].split('');
  return letter[2];
}
