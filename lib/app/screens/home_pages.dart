import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/empty_image.dart';
import '../components/generated_image.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textController = TextEditingController();
  final controller = Get.put(HomeController());

  Widget buildGeneratedImage() {
    if (textController.text.isEmpty) {
      return const EmptyImageWidget();
    }
    return GeneratedImage(
      controller: controller,
      text: textController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildGeneratedImage(),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Ex: Gato com oculus',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_forward_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
