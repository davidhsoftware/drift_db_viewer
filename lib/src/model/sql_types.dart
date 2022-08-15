class BoolType {
  const BoolType();

  bool? mapFromDatabaseResponse(int? response) {
    if (response == null) return null;
    return response != 0;
  }

  String mapToSqlConstant(bool? content) {
    if (content == null) {
      return 'NULL';
    }
    return content ? '1' : '0';
  }

  int? mapToSqlVariable(bool? content) {
    if (content == null) {
      return null;
    }
    return content ? 1 : 0;
  }
}

class DateTimeType {
  const DateTimeType();

  DateTime? mapFromDatabaseResponse(int? response) {
    if (response == null) return null;

    final unixSeconds = response;
    return DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000);
  }

  String? mapToSqlConstant(DateTime? content) {
    if (content == null) return 'NULL';

    return (content.millisecondsSinceEpoch ~/ 1000).toString();
  }

  int? mapToSqlVariable(DateTime? content) {
    if (content == null) return null;

    return content.millisecondsSinceEpoch ~/ 1000;
  }
}
