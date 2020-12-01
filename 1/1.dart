import 'dart:io';
import 'dart:convert';

buildMap(input) {
  var map = Map();
  var ls = new LineSplitter();
  List<String> list = ls.convert(input);
  for (var item in list) {
    map[int.parse(item)] = true;
  }
  return map;
}

Future main() async {
  var input = await File('input.txt').readAsString();
  var map = buildMap(input);
  for (var a in map.keys) {
    var diff = 2020 - a;
    if (map[diff] ?? false) {
      var result = a * diff;
      print(result);
      return;
    }
  }
}
