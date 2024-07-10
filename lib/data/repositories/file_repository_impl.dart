// lib/data/repositories/file_repository_impl.dart
import 'dart:io';
import 'package:file_sync_app/domain/entities/file_entity.dart';
import 'package:file_sync_app/domain/repositories/file_repository.dart';
import 'package:flutter_aws_s3_client/flutter_aws_s3_client.dart';

class FileRepositoryImpl implements FileRepository {
  final AwsS3Client client;

  FileRepositoryImpl(this.client);

  @override
  Future<void> uploadFile(FileEntity file) async {
    final File localFile = File(file.path);
    await client.uploadFile(localFile, file.name);
  }

  @override
  Future<void> downloadFile(String fileName, String downloadPath) async {
    final response = await client.downloadFile(fileName);
    final file = File(downloadPath);
    await file.writeAsBytes(response.bodyBytes);
  }
}
