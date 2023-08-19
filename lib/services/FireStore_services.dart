import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:firebase_core/firebase_core.dart' as fc;

class Storage {
  final fs.FirebaseStorage _storage =
      fs.FirebaseStorage.instance;


Future<void> FilesUpload(
  String fileName,
  String pathlocal,
  
 ) async {

     File file = File(pathlocal);
  

  try {
    await _storage.ref('uploads/$fileName').putFile(file);
  } on fc.FirebaseException catch (e) {
    print(e);
  }
 }
}