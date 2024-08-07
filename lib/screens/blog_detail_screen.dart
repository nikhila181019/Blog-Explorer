import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogDetailScreen extends StatelessWidget {
  final dynamic blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog['title'] ?? ''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: blog['image_url'] ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              blog['title'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              blog['content'] ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
