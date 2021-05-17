import 'package:hive/hive.dart';
import 'package:loyalty_hd/data/model/loyalty_user.dart';
import 'package:path_provider/path_provider.dart';

class UserService {
  String _userDBPath = "userDB";
  var _box;

  Future<LoyaltyUser> getUser(String login) async {
    await _initBoxDB();
    LoyaltyUser loyaltyUser;
    loyaltyUser = _box.get(login);
    return loyaltyUser;
  }

  Future<void> saveUser(LoyaltyUser loyaltyUser) async {
    await _initBoxDB();
    _box.put(loyaltyUser.login, loyaltyUser);
  }

  _initBoxDB() async {
    if (_box == null) {
      String path = await _localPath();
      Hive
        ..init(path)
        ..registerAdapter(LoyaltyUserAdapter());
      _box = await Hive.openBox(_userDBPath);
    }
  }

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
