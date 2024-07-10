// lib/domain/entities/file_entity.dart
import 'package:equatable/equatable.dart';

class FileEntity extends Equatable {
  final String name;
  final String path;

  FileEntity(this.name, this.path);

  @override
  List<Object> get props => [name, path];
}
