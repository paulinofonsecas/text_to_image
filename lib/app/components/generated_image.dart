// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:stability_ai/stability_ai.dart';

import '../controllers/home_controller.dart';

class GeneratedImage extends StatelessWidget {
  const GeneratedImage({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  final HomeController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<Answer>(
        stream: controller.generateImage(text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Ocorreu um erro ao se comunicar com o servidor!'),
              );
            }

            if (snapshot.data == null) {
              return const Center(
                child: Text('Sem imagens'),
              );
            }

            return _GeneratedImageWidget(answer: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _GeneratedImageWidget extends StatelessWidget {
  const _GeneratedImageWidget({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    var artifact = answer.artifacts
        .where((element) => element.type == ArtifactType.ARTIFACT_IMAGE)
        .first;
    var bytes = Uint8List.fromList(artifact.binary);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.memory(
        bytes,
      ),
    );
  }
}
