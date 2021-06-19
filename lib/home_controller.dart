import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _isLoading = false;
  List<String> _data = ["", "", "", "", "", "", "", "", "", ""];

  Future<void> setData(List<String> value) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 5), () {});
    _data.addAll(value);
    _isLoading = false;
    update();
  }

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  List<String> get data => _data;
}
