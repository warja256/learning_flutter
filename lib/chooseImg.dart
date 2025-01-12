import 'package:flutter/material.dart';

class ChooseImg extends StatefulWidget {
  const ChooseImg({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ChooseImg> createState() => _ChooseImgState();
}

class _ChooseImgState extends State<ChooseImg> {
  // Список для отслеживания фокуса для каждой картинки
  List<bool> _focusedList = [false, false, false];

  void _setFocused(int index) {
    setState(() {
      // Переключаем состояние фокуса только для выбранной картинки
      _focusedList[index] = !_focusedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final flag = constraints.maxHeight > constraints.maxWidth;
            if (flag) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        // Список изображений
                        final images = [
                          'asset/jpeg/kitten.jpeg',
                          'asset/jpeg/flower.jpeg',
                          'asset/jpeg/discoball.jpeg',
                        ];
                        return GestureDetector(
                          onTap: () {
                            _setFocused(
                                index); // Переключаем состояние фокуса для выбранной картинки
                          },
                          child: FocusableActionDetector(
                            onShowFocusHighlight: (focused) =>
                                _setFocused(index),
                            onShowHoverHighlight: (focused) =>
                                _setFocused(index),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: _focusedList[index]
                                    ? BorderRadius.circular(
                                        32) // Округление для выбранной картинки
                                    : BorderRadius.circular(
                                        0), // Без округления для остальных
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(images[index]),
                                ),
                              ),
                            ),
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
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        // Список изображений
                        final images = [
                          'asset/jpeg/kitten.jpeg',
                          'asset/jpeg/flower.jpeg',
                          'asset/jpeg/discoball.jpeg',
                        ];
                        return GestureDetector(
                          onTap: () {
                            _setFocused(
                                index); // Переключаем состояние фокуса для выбранной картинки
                          },
                          child: FocusableActionDetector(
                            onShowFocusHighlight: (focused) =>
                                _setFocused(index),
                            onShowHoverHighlight: (focused) =>
                                _setFocused(index),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: _focusedList[index]
                                    ? BorderRadius.circular(
                                        32) // Округление для выбранной картинки
                                    : BorderRadius.circular(
                                        0), // Без округления для остальных
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(images[index]),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
