import 'package:dio/dio.dart';
import 'package:money_tracking_app/constants/baseurl_constant.dart';
import 'package:money_tracking_app/models/money.dart';

class MoneyApi {
  final dio = Dio();

  Future<List<Money>> getMoneyByType(Money money) async {
    try {
      final Map<String, dynamic> requestBody = {
        'moneyType': money.moneyType,
        'userId': money.userId,
      };
      final responseData = await dio.get(
        '$baseUrl/money/',
        data: requestBody,
        options: Options(headers: {'content-type': 'application/json'}),
      );
      if (responseData.statusCode == 200) {
        return List<Money>.from(
          responseData.data.map((x) => Money.fromJson(x)),
        );
      } else {
        return [];
      }
    } catch (err) {
      print('ERROR: ${err.toString()}');
      return [];
    }
  }

  Future<bool> inOutMoney(Money money) async {
    try {
      final Map<String, dynamic> requestBody = {
        'moneyDetail': money.moneyDetail,
        'moneyDate': money.moneyDate,
        'moneyInOut': money.moneyInOut,
        'moneyType': money.moneyType,
        'userId': money.userId,
      };

      final responseData = await dio.post(
        '$baseUrl/money/',
        data: requestBody,
        options: Options(headers: {'content-type': 'application/json'}),
      );

      if (responseData.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print('ERROR: ${err.toString()}');
      return false;
    }
  }
}
