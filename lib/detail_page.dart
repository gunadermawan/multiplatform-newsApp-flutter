import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'model/article.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.description),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              article.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Text('Date: ${article.publishedAt}'),
            const SizedBox(height: 10),
            Text('Author: ${article.author}'),
            const Divider(color: Colors.grey),
            Text(
              article.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ArticleWebview.routeName,
                      arguments: article.url);
                },
                child: const Text('Read More'))
          ],
        ),
      ),
    );
  }
}

class ArticleWebview extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;

  const ArticleWebview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        title: Text('News Appp'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
