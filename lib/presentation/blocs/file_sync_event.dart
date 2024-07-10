// lib/presentation/blocs/file_sync_event.dart
part of 'file_sync_bloc.dart';

abstract class FileSyncEvent extends Equatable {
  const FileSyncEvent();

  @override
  List<Object> get props => [];
}

class UploadFileEvent extends FileSyncEvent {
  final FileEntity file;

  const UploadFileEvent(this.file);

  @override
  List<Object> get props => [file];
}

class DownloadFileEvent extends FileSyncEvent {
  final String fileName;
  final String downloadPath;

  const DownloadFileEvent(this.fileName, this.downloadPath);

  @override
  List<Object> get props => [fileName, downloadPath];
}
