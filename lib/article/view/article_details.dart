import 'package:flutter/material.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.title,
    required this.description,
    required this.content,
    super.key,
  });

  final String author;
  final String publishedAt;
  final String urlToImage;
  final String title;
  final String description;
  final String content;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateTime.parse(publishedAt).toString();
    formattedDate = formattedDate.substring(0, formattedDate.length - 5);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsRead',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              urlToImage != ''
                  ? Container(
                      height: 400.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            urlToImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/image_not_available.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                    ),
              Container(
                margin: const EdgeInsets.all(
                  15,
                ),
                padding: const EdgeInsets.only(
                  bottom: 15,
                  top: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0,
                        height: 1.4,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(formattedDate),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(author),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
