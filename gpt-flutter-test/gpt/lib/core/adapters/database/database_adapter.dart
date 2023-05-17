import 'package:gpt/core/services/database/queries_service.dart';

abstract class DatabaseAdapter {
  execute(String sql) {}
  close() {}
  QueriesService instance();
}
