import 'package:file_sync_app/domain/entities/file_entity.dart';
import 'package:file_sync_app/domain/repositories/file_repository.dart';

class UploadFile {
  final FileRepository repository;

  UploadFile(this.repository);

  Future<void> call(FileEntity file) async {
    return await repository.uploadFile(file);
  }
}
