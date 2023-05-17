import 'package:gpt/core/adapters/database/queries_adapter.dart';

import '../../models/database/sql_column.dart';

class QueriesService implements QueriesAdapter {
  late String _sql;
  late String _table;
  late dynamic _instance;

  QueriesService(String table, dynamic instance) {
    _table = table;
    _instance = instance;
  }

  @override
  QueriesService create(List<SqlColumn> values) {
    String columns =
        values.map((column) => "${column.key} ${column.value}").join(", ");
    _sql = 'CREATE TABLE $_table ($columns)';
    return this;
  }

  @override
  QueriesService delete() {
    _sql = 'DELETE FROM  $_table';
    return this;
  }

  @override
  execute() async => await _instance.execute(_sql);

  @override
  QueriesService insert(List<SqlColumn> values) {
    String columns =
        values.map((column) => "${column.key} = ${column.value}").join(", ");
    _sql = "INSERT INTO $_table VALUES $columns";
    return this;
  }

  @override
  QueriesService update(List<SqlColumn> values) {
    _sql = 'UPDATE $_table SET $values';
    return this;
  }

  @override
  close() => _instance.close();

  @override
  QueriesService and(String condition) {
    _sql = "$_sql AND $condition";
    return this;
  }

  @override
  QueriesService groupBy(SqlColumn condition) {
    _sql = "$_sql GROUP BY $condition";

    return this;
  }

  @override
  QueriesService or(String condition) {
    _sql = "$_sql OR $condition";
    return this;
  }

  @override
  QueriesService orderBy(SqlColumn condition) {
    _sql = "$_sql ORDER BY $condition";

    return this;
  }

  @override
  QueriesService select(String fields) {
    _sql = "SELECT $fields FROM $_table";
    return this;
  }

  @override
  QueriesService where(String condition) {
    _sql = "$_sql WHERE $condition";

    return this;
  }
}
