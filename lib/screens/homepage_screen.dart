import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/bloc/article_bloc.dart';
import 'package:newsread_flutter/bloc/article_events.dart';
import 'package:newsread_flutter/bloc/article_state.dart';
import 'package:newsread_flutter/repository/article_repository.dart';
import 'package:newsread_flutter/screens/widgets/custom_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleBloc(
        RepositoryProvider.of<ArticleRepository>(context),
      )..add(LoadArticleEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "NewsRead",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ArticleLoadedState) {
              print(state.article);
              return ListView.builder(
                itemCount: state.article.length,
                itemBuilder: (context, index) => CustomListTile(
                  article: state.article[index],
                ),
              );
            }
            if (state is ArticleErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// import '../model/article_model.dart';
// import '../services/api_service.dart';
// import 'widgets/custom_list_tile.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   ApiService client = ApiService();
//   late Future<List<Article>> getArticles;

//   @override
//   void initState() {
//     getArticles = client.getArticle();
//     super.initState();
//   }

//   Future<void> _pullRefresh() async {
//     setState(() {
//       getArticles = client.getArticle();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "NewsRead",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//         future: getArticles,
//         builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
//           if (snapshot.hasData) {
//             List<Article> articles = snapshot.data as List<Article>;
//             return RefreshIndicator(
//               onRefresh: _pullRefresh,
//               child: ListView.builder(
//                 itemCount: articles.length,
//                 itemBuilder: (context, index) => CustomListTile(
//                   article: articles[index],
//                 ),
//               ),
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
