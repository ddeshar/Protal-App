import 'package:flutter/material.dart';
import 'package:protal_app/Pages/newsdetails.dart';

class NewsCard extends StatelessWidget {
  final String imgUrl, title, desc;

  const NewsCard({
    Key? key,
    required this.imgUrl,
    required this.desc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsPage(
              imgUrl: imgUrl,
              title: title,
              body: desc,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.network(
                imgUrl,
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Center(
                      child:
                          Icon(Icons.broken_image_outlined, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
              child: Text(
                _truncateDescription(desc),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateDescription(String description) {
    if (description.length > 200) {
      return "${description.substring(0, 200)}........";
    }
    return description;
  }
}
