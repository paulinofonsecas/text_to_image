import 'package:flutter/material.dart';

class EmptyImageWidget extends StatelessWidget {
  const EmptyImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * .5,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/gatinho.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 16),
          const Text(
            'Vamos criar uma image?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Digite abaixo quais imagens quer gerar.',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
