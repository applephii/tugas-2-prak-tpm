import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas2/model/cat.dart';

class CatDetailPage extends StatefulWidget {
  final Cat kucing;
  final Function(Cat) onUpdate;
  const CatDetailPage({Key? key, required this.kucing, required this.onUpdate})
      : super(key: key);

  @override
  State<CatDetailPage> createState() => _CatDetailPageState();
}

class _CatDetailPageState extends State<CatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kucing.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.kucing.pictureUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder(
                  horizontalInside:
                      BorderSide(color: Colors.transparent, width: 1),
                  verticalInside:
                      BorderSide(color: Colors.transparent, width: 1),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(10),
                  3: FlexColumnWidth()
                },
                children: [
                  TableRow(
                    children: [
                      Text('Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.kucing.name),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Birthday',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      
                      Text(DateFormat('dd-MM-yyyy').format(widget.kucing.birthday)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Age',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${widget.kucing.age} years'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Breed',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.kucing.breed),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Color',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.kucing.color),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Sex',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.kucing.sex),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Vaccines',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.kucing.vaccines
                            .map((vaccine) => Text('- $vaccine'))
                            .toList(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Characteristics',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.kucing.characteristics
                            .map((characteristic) => Text('- $characteristic'))
                            .toList(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Background',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.kucing.background),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Your Favorite',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.kucing.isFavorite ? "Yes" : "No"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.kucing.toggleFavorite();
                    widget.onUpdate(widget.kucing);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.kucing.isFavorite
                        ? const Color.fromARGB(255, 79, 116, 80)
                        : const Color.fromARGB(255, 147, 211, 149),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            widget.kucing.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color:
                                widget.kucing.isFavorite ? Colors.yellow : null,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.kucing.toggleFavorite();
                              widget.onUpdate(widget.kucing);
                            });
                          },
                        ),
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.kucing.isFavorite
                                ? Colors.white
                                : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
