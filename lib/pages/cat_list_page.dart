import 'package:flutter/material.dart';
import 'package:tugas2/data/cats.dart';
// import 'package:tugas2/model/cat.dart';
import 'package:tugas2/pages/cat_detail_page.dart';

class CatListPage extends StatefulWidget {
  const CatListPage({super.key});

  @override
  State<CatListPage> createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House of Cats'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.69,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: catList.length,
        itemBuilder: (context, index) {
          final kucing = catList[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatDetailPage(
                    kucing: kucing,
                    onUpdate: (updatedCat) {
                      setState(() {
                        catList[index] =
                            updatedCat;
                      });
                    },
                  ),
                ),
              );
            },
            child: Card(
              color: const Color.fromARGB(255, 147, 211, 149),
              elevation: 4,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    child: Image.network(kucing.pictureUrl, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(kucing.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Text('Age: ${kucing.age}', style: TextStyle(fontSize: 16)),
                  Text('Breed: ${kucing.breed}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Tap for More Detail',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            kucing.isFavorite ? Icons.star : Icons.star_border,
                            color: kucing.isFavorite ? Colors.yellow : null,
                          ),
                          onPressed: () {
                            setState(() {
                              kucing.toggleFavorite();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
