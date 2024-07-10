part of 'file_sync_bloc.dart';

abstract class FileSyncState extends Equatable {
  const FileSyncState();

  @override
  List<Object> get props => [];
}

class FileSyncInitial extends FileSyncState {}

class FileSyncLoading extends FileSyncState {}

class FileSyncSuccess extends FileSyncState {}

class FileSyncFailure extends FileSyncState {}
