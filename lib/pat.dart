import 'package:flutter/material.dart';

class Pat extends StatefulWidget {
  const Pat({super.key, required this.title});
  final String title;

  @override
  State<Pat> createState() => _PatState();
}

class _PatState extends State<Pat> {
  int counterPat = 0;

  bool _isPulsing = true;

  void _onPat() {
    setState(() {
      counterPat++;
    });
  }

  // Функция для пульсации кнопки
  void _pulseButton() {
    setState(() {
      _isPulsing = !_isPulsing; // Переключаем пульсацию
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 40), // Отступы по бокам
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Центрируем элементы по горизонтали
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Чтобы погладить, нажмите на кнопку!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: SizedBox(
                    height: 400, // Ограничиваем высоту карточки
                    width: double.infinity, // Делаем карточку шире
                    child: Stack(
                      alignment:
                          Alignment.center, // Центрируем содержимое внутри
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'asset/png/patDog.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          child: GestureDetector(
                            onTap: () {
                              _onPat();
                              _pulseButton(); // Запускаем пульсацию
                            },
                            child: AnimatedScale(
                              scale: _isPulsing
                                  ? 1.3
                                  : 1.0, // Увеличиваем масштаб до 1.3 для пульсации
                              duration: const Duration(
                                  milliseconds:
                                      500), // Увеличиваем длительность анимации
                              curve: Curves.easeInOut,
                              child: Image.asset(
                                'asset/png/pat.png',
                                width: 80,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Столько раз вы погладили: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '$counterPat',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
