import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritePets extends StatelessWidget {
  const FavouritePets({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isPortrait =
                constraints.maxHeight > constraints.maxWidth;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: isPortrait
                  ? ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FavPet('Lucy', '4', 'British', 'asset/svg/cat.svg',
                                isPortrait),
                            SizedBox(width: 10),
                            FavPet('Rocky', '2', 'Corgi', 'asset/svg/dog.svg',
                                isPortrait),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FavPet('Bella', '3', 'Siamese',
                                'asset/svg/cat2.svg', isPortrait),
                            SizedBox(width: 10),
                            FavPet('Max', '5', 'Labrador', 'asset/svg/dog2.svg',
                                isPortrait),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FavPet('Daisy', '1', 'Holstein',
                                'asset/svg/cow.svg', isPortrait),
                            SizedBox(width: 10),
                            FavPet('Croc', '7', 'Nile Crocodile',
                                'asset/svg/crocodile.svg', isPortrait),
                          ],
                        )
                      ],
                    )
                  : ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FavPet('Lucy', '4', 'British', 'asset/svg/cat.svg',
                                isPortrait),
                            SizedBox(width: 10),
                            FavPet('Rocky', '2', 'Corgi', 'asset/svg/dog.svg',
                                isPortrait),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FavPet('Bella', '3', 'Siamese',
                                'asset/svg/cat2.svg', isPortrait),
                            SizedBox(width: 10),
                            FavPet('Max', '5', 'Labrador', 'asset/svg/dog2.svg',
                                isPortrait),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FavPet('Daisy', '1', 'Holstein',
                                'asset/svg/cow.svg', isPortrait),
                            SizedBox(width: 10),
                            FavPet('Croc', '7', 'Nile Crocodile',
                                'asset/svg/crocodile.svg', isPortrait),
                          ],
                        )
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}

// 🔹 Виджет карточки питомца
class FavPet extends StatelessWidget {
  const FavPet(this.name, this.age, this.breed, this.photo, this.isPortrait,
      {super.key});

  final String name;
  final String age;
  final String breed;
  final String photo;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return isPortrait
        ? SizedBox(
            width: 180,
            height: 270,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: SizedBox(
                      height: 180,
                      child: SvgPicture.asset(photo, fit: BoxFit.contain),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("$age,"),
                                const SizedBox(width: 10),
                                Text(breed),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            width: 360,
            height: 190,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: SizedBox(
                      height: 160,
                      child: SvgPicture.asset(photo, fit: BoxFit.contain),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("$age,"),
                                const SizedBox(width: 10),
                                Text(breed),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
