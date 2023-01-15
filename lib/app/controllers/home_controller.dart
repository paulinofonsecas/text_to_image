// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

import 'package:stability_ai/stability_ai.dart';

class HomeController extends GetxController {
  Stream<Answer> generateImage(String text) {
    var apiClient = Get.find<String>(tag: 'api_client');
    var client = StabilityAIClient(apiClient);
    var generationService = client.generation;

    var imageParams = ImageParameters(
      height: Int64.parseInt('512'),
      width: Int64.parseInt('512'),
      samples: Int64.parseInt('1'),
      steps: Int64.parseInt('50'),
    );

    // create a text prompt request.
    var req = Request(
      prompt: [Prompt(text: text)],
      engineId: 'stable-diffusion-512-v2-1',
      image: imageParams,
    );

    // send the request. The response is a stream.
    return generationService.generate(req);
  }
}
