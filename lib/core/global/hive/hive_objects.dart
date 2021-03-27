import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String secondName;

  User(this.firstName, this.secondName);
}
