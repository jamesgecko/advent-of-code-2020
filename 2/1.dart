import 'dart:io';
import 'dart:convert';

bool test(int min, int max, String char, String pass, bool log) {
  var count = 0;
  for (var i = 0; i < pass.length; i++) {
    if (pass[i] == char) {
      count++;
    }
  }
  var result = (count >= min && count <= max);
  if (log) {
    var resultEmoji = result ? '✅' : '❌';
    print(resultEmoji + " '" + min.toString() + "', '" + max.toString() + "', '" + char + "', '" + pass + "'");
  }
  return result;
}

bool test2(int min, int max, String char, String pass, bool log) {
  var result = ((pass[min - 1] == char && pass[max - 1] != char) ||
    (pass[min - 1] != char && pass[max - 1] == char));
  if (log) {
    var resultEmoji = result ? '✅' : '❌';
    print(resultEmoji + " '" + min.toString() + "', '" + max.toString() + "', '" + char + "', '" + pass + "'");
  }
  return result;
}

Future main() async {
  var input = await File('input.txt').readAsString();
  var ls = new LineSplitter();
  List<String> list = ls.convert(input);
  var count = 0;
  var count2 = 0;
  for (var item in list) {
    var atoms = item.split(' ');
    var range = atoms[0].split('-');
    var lower = int.parse(range[0]);
    var upper = int.parse(range[1]);
    var letter = atoms[1][0];
    var password = atoms[2];
    if (test(lower, upper, letter, password, false)) { count++; }
    if (test2(lower, upper, letter, password, true)) { count2++; }
  }
  print('---');
  print('Part 1: ' + count.toString());
  print('Part 2: ' + count2.toString());
}
