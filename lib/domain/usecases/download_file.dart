import 'package:file_sync_app/domain/repositories/file_repository.dart';

class DownloadFile {
  final FileRepository repository;

  DownloadFile(this.repository);

  Future<void> call(String fileName, String downloadPath) async {
    return await repository.downloadFile(fileName, downloadPath);
  }
}