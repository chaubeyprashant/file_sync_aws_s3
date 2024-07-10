// lib/di/di.dart
import 'package:flutter_aws_s3_client/flutter_aws_s3_client.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:file_sync_app/data/repositories/file_repository_impl.dart';
import 'package:file_sync_app/domain/repositories/file_repository.dart';
import 'package:file_sync_app/domain/usecases/upload_file.dart';
import 'package:file_sync_app/domain/usecases/download_file.dart';
import 'package:file_sync_app/presentation/blocs/file_sync_bloc.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerLazySingleton<AwsS3Client>(() => AwsS3Client(
    region: 'us-east-1',
    bucketId: 'your-bucket-name',
    accessKey: 'your-access-key',
    secretKey: 'your-secret-key',
  ));
  getIt.registerLazySingleton<FileRepository>(() => FileRepositoryImpl(getIt()));
  getIt.registerLazySingleton(() => UploadFile(getIt()));
  getIt.registerLazySingleton(() => DownloadFile(getIt()));
  getIt.registerFactory(() => FileSyncBloc(
    uploadFile: getIt(),
    downloadFile: getIt(),
  ));
}
