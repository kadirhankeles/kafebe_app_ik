import 'package:http/http.dart' as http;

void main() async {
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization': 'shwjCj+ErPrhOZikoYEuTiV3bvMzcRE0mbgEXqhSbPtYuRk4U94EemoqET1Lp/Dq~1694~string~638095072172983409',
  };

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/RequestManagement/GetPendingJobs');
  var res = await http.post(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  print(res.body);
}
