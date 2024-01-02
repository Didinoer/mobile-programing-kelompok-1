import '../helpers/user_info.dart';

class SearchService {
  Future<String> search(String namaakun) async {
    if (namaakun == 'facebook') {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
    }
    return namaakun;
  }

  //  Future<bool> search(String namaakun) async {
  //   bool isLogin = false;
  //   if (namaakun == 'facebook') {
  //     await UserInfo().setToken("admin");
  //     await UserInfo().setUserID("1");
  //     await UserInfo().setUsername("admin");
  //     isLogin = true;
  //   }
  //   return isLogin;
  // }
}
