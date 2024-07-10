import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_sync_app/domain/entities/file_entity.dart';
import 'package:file_sync_app/presentation/blocs/file_sync_bloc.dart';
import 'package:path_provider/path_provider.dart';

class FileSyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File Sync App')),
      body: BlocConsumer<FileSyncBloc, FileSyncState>(
        listener: (context, state) {
          if (state is FileSyncSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Operation Successful')));
          } else if (state is FileSyncFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Operation Failed')));
          }
        },
        builder: (context, state) {
          if (state is FileSyncLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _uploadFile(context),
                  child: Text('Upload File'),
                ),
                ElevatedButton(
                  onPressed: () => _downloadFile(context),
                  child: Text('Download File'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _uploadFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final filePath = result.files.single.path;
      if (filePath != null) {
        final file = FileEntity(result.files.single.name, filePath);
        context.read<FileSyncBloc>().add(UploadFileEvent(file));
      }
    }
  }

  Future<void> _downloadFile(BuildContext context) async {
    final dir = await getApplicationDocumentsDirectory();
    final downloadPath = '${dir.path}/downloaded_file';
    context.read<FileSyncBloc>().add(DownloadFileEvent('your-download-key', downloadPath));
  }
}
