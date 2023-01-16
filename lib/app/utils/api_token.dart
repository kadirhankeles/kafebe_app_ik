import 'package:get_storage/get_storage.dart';

final cacheToken = GetStorage();

 String apiToken = cacheToken.read("token") != null
    ? cacheToken.read("token")
    : "5ldhVpE+x0e1woIhKJDy0DZaWM5FX8fNrIFHVeQJljGU7GqDvXSnfcSDZCxoih/+~2270~string~638093270751002182";
