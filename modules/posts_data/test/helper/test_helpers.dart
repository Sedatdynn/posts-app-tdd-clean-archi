import 'dart:io';

String jsonHelper(String fileName) => File('test/helper/$fileName.json').readAsStringSync();
