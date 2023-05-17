import 'package:gpt/core/adapters/database/database_adapter.dart';
import 'package:gpt/core/services/database/queries_service.dart';
import 'package:sqflite/sqflite.dart';

class SqLiteService implements DatabaseAdapter {
  late Database _instance;
  late String _table;
  SqLiteService(String databaseName) {
    _initialize(databaseName);
  }

  Future<void> _initialize(String databaseName) async {
    _instance = await openDatabase(databaseName);
  }

  @override
  QueriesService instance() => QueriesService(_table, _instance);
  @override
  close() => _instance.close();

  @override
  execute(String sql) => _instance.execute(sql);
}
