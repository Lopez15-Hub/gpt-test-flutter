import '../../models/database/sql_column.dart';

abstract class QueriesAdapter {
  close() {}
  create(List<SqlColumn> values) {}
  insert(List<SqlColumn> values) {}
  select(String fields) {}
  groupBy(SqlColumn condition) {}
  orderBy(SqlColumn condition) {}
  where(String condition) {}
  and(String condition) {}
  or(String condition) {}
  update(List<SqlColumn> values) {}
  execute() {}
  delete() {}
}
