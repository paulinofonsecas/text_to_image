import 'package:get/get.dart';

class AppBindings extends Bindings {
  var apiClient = 'sk-DBREcN4JHNZ9Ti5VwIDlU6Z3cFqX3nMLSGsrbZNfMQpToQSx';
  
  @override
  void dependencies() {
    Get.put(apiClient, tag: 'api_client');
  }
}
