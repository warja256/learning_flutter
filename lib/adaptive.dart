import 'package:flutter/cupertino.dart';
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(child: LayoutBuilder(builder: (context, constraits) {
        final flag = constraits.maxHeight > constraits.maxWidth;
        if (flag) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                // ПРИМЕР РАБОТЫ GridView
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Количество столбцов
                    crossAxisSpacing: 10.0, // Отступ между столбцами
                    mainAxisSpacing: 10.0, // Отступ между строками
                    childAspectRatio:
                        1.0, // Соотношение сторон (ширина / высота)
                  ),
                  itemCount: 3, // Количество элементов
                  itemBuilder: (context, index) {
                    // Список изображений
                    final images = [
                      'asset/jpeg/kitten.jpeg',
                      'asset/jpeg/flower.jpeg',
                      'asset/jpeg/discoball.jpeg',
                    ];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              width: 200,
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Вы нажали на фото!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: CupertinoColors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Закрыть',
                                            style: TextStyle(
                                              color: CupertinoColors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ));
                          },
                        );
                      },
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
                // ПРИМЕР РАБОТЫ GridView
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Количество столбцов
                    crossAxisSpacing: 10.0, // Отступ между столбцами
                    mainAxisSpacing: 10.0, // Отступ между строками
                    childAspectRatio:
                        1.0, // Соотношение сторон (ширина / высота)
                  ),
                  itemCount: 3, // Количество элементов
                  itemBuilder: (context, index) {
                    // Список изображений
                    final images = [
                      'asset/jpeg/kitten.jpeg',
                      'asset/jpeg/flower.jpeg',
                      'asset/jpeg/discoball.jpeg',
                    ];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              width: 200,
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Вы нажали на фото!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: CupertinoColors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Закрыть',
                                            style: TextStyle(
                                              color: CupertinoColors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ));
                          },
                        );
                      },
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      })),
    );
  }
}
