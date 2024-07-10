// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_sync_app/di/di.dart';
import 'package:file_sync_app/presentation/blocs/file_sync_bloc.dart';
import 'package:file_sync_app/presentation/pages/file_sync_page.dart';


void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => getIt<FileSyncBloc>(),
        child: FileSyncPage(),
      ),
    );
  }
}
