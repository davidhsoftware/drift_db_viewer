import 'package:db_viewer/db_viewer.dart';
import 'package:drift_db_viewer/src/model/sql_types.dart';

class BoolWhereClause extends WhereClause {
  bool _value = true;

  @override
  String get typeName => 'BOOL';

  bool get value => _value;

  BoolWhereClause(String columnName) : super(columnName: columnName);

  @override
  String getSqlWhereClause() {
    final boolType = BoolType();
    return ' $columnName = ${boolType.mapToSqlVariable(_value)}';
  }

  @override
  WhereClause copy() {
    final whereClause = BoolWhereClause(columnName);
    whereClause._value = _value;
    return whereClause;
  }

  void onSelectedChanged(bool value) => _value = value;
}
