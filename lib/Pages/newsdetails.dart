import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  final String imgUrl, title, body;

  NewsDetailsPage({
    required this.imgUrl,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgUrl,
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

            const Center(child: RatingWidget()),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                body,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: List.generate(
            5,
            (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < rating ? Colors.yellow : Colors.grey,
                  ),
                )),
      ),
    );
  }
}
