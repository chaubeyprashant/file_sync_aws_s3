// lib/domain/repositories/file_repository.dart
import 'package:file_sync_app/domain/entities/file_entity.dart';

abstract class FileRepository {
  Future<void> uploadFile(FileEntity file);
  Future<void> downloadFile(String fileName, String downloadPath);
}
