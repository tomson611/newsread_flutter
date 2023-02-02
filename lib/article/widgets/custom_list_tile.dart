import 'package:flutter/material.dart';
import 'package:newsread_flutter/repository/model/article_model.dart';
import 'package:newsread_flutter/webview/view/web_view.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: article.url,
              title: article.title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != ''
                ? Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(article.urlToImage),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  )
                : Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/image_not_available.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              article.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebView(
                        url: article.url,
                        title: article.title,
                      ),
                    ),
                  );
                },
                child: const Text('Read'))
          ],
        ),
      ),
    );
  }
}
