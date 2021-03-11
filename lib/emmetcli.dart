import 'dart:io';

import 'package:emmet/emmet.dart';

Future generateHtmlTests() async {
  var testParser = TestParser();
  var htmlGenerator = HtmlGenerator();

  var testFiles = testParser.parseFolder('./test');
  testFiles.forEach((element) async {
    print('=> ${element.path}');
    print('   nb tests: ${element.tests.length}');
    var testFileHtml = await htmlGenerator.processSingle(element);
    var name = element.path.split('/').last;
    await _writeFile('$name.html', testFileHtml);
    print('   $name.html created');
  });
  await _writeFile('index.html', await htmlGenerator.createIndex('Test Doc report', testFiles));
  print('   index.html created');
}

Future<Directory> _getOrCreateEmmetDirectory() async {
  var emmetDirectory = Directory('./emmet');
  if (!emmetDirectory.existsSync()) {
    emmetDirectory = await emmetDirectory.create();
  }
  return emmetDirectory;
}

Future<File> _writeFile(String name, String content) async {
  var exportDir = await _getOrCreateEmmetDirectory();
  var file = File('${exportDir.path}/$name');
  if (!file.existsSync()) {
    file = await file.create();
  }
  file = await file.writeAsString(content);
  return file;
}
