// lib/presentation/blocs/file_sync_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_sync_app/domain/entities/file_entity.dart';
import 'package:file_sync_app/domain/usecases/upload_file.dart';
import 'package:file_sync_app/domain/usecases/download_file.dart';

part 'file_sync_event.dart';
part 'file_sync_state.dart';

class FileSyncBloc extends Bloc<FileSyncEvent, FileSyncState> {
  final UploadFile uploadFile;
  final DownloadFile downloadFile;

  FileSyncBloc({required this.uploadFile, required this.downloadFile}) : super(FileSyncInitial());

  @override
  Stream<FileSyncState> mapEventToState(FileSyncEvent event) async* {
    if (event is UploadFileEvent) {
      yield FileSyncLoading();
      try {
        await uploadFile(event.file);
        yield FileSyncSuccess();
      } catch (_) {
        yield FileSyncFailure();
      }
    } else if (event is DownloadFileEvent) {
      yield FileSyncLoading();
      try {
        await downloadFile(event.fileName, event.downloadPath);
        yield FileSyncSuccess();
      } catch (_) {
        yield FileSyncFailure();
      }
    }
  }
}


// lib/presentation/blocs/file_sync_state.dart
