import '../../utils/request.dart';

loginByUsername(String username, String password) async {
  var result = await HttpUtils.request(
    "/assets/website/login.pda_check.xhtml",
    method: HttpUtils.GET,
    data: {
      "username":  username,
      "orgstaff_.cpassword": password,
      'nleixing': 0,
      'language': 'ch'
    },
  );
  return result;
}
