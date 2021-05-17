import 'package:hive/hive.dart';

part 'loyalty_user.g.dart';

@HiveType(typeId: 0)
class LoyaltyUser {
  @HiveField(0)
  String ?login;

  @HiveField(1)
  String ?password;

  @override
  String toString() {
    return 'LoyaltyUser{name: $login, age: $password}';
  }
}
