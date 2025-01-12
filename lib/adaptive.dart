import 'package:flutter/material.dart';

class Adaptive extends StatefulWidget {
  const Adaptive({super.key, required this.title});

  final String title;

  @override
  State<Adaptive> createState() => _AdaptiveState();
}

class _AdaptiveState extends State<Adaptive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // ПРИМЕР РАБОТЫ GridView
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Количество столбцов
                  crossAxisSpacing: 10.0, // Отступ между столбцами
                  mainAxisSpacing: 10.0, // Отступ между строками
                  childAspectRatio: 1.0, // Соотношение сторон (ширина / высота)
                ),
                itemCount: 3, // Количество элементов
                itemBuilder: (context, index) {
                  // Список изображений
                  final images = [
                    'asset/jpeg/kitten.jpeg',
                    'asset/jpeg/flower.jpeg',
                    'asset/jpeg/discoball.jpeg',
                  ];
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
