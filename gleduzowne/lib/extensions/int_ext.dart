import 'package:gleduzowne/utils.dart';

extension IntegerExtensions on int {
  int get digitCount => (log10(this) + 1).truncate();
}
