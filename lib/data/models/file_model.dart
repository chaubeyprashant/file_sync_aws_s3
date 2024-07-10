import 'package:file_sync_app/domain/entities/file_entity.dart';

class FileModel extends FileEntity {
  FileModel(String name, String path) : super(name, path);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
    };
  }

  static FileModel fromJson(Map<String, dynamic> json) {
    return FileModel(json['name'], json['path']);
  }
}
