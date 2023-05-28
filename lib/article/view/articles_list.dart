import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/article/bloc/article_bloc.dart';
import 'package:newsread_flutter/article/bloc/article_events.dart';
import 'package:newsread_flutter/article/bloc/article_state.dart';
import 'package:newsread_flutter/article/widgets/custom_list_tile.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExpansionTile(
          title: Text('Filters'),
          children: [MyCustomForm()],
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<ArticleBloc>(context).add(LoadArticleEvent(
                  country: _DropdownButtonExampleState.getValue()));
            },
            child: BlocBuilder<ArticleBloc, ArticleState>(
              builder: (BuildContext context, state) {
                if (state is ArticleLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ArticleLoadedState) {
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    cacheExtent: 200,
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
        ),
      ],
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  static late String country;

  static get getCountry {
    return country;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField(
            items: dropdownItems,
            onChanged: (val) => setState(() => country = val as String),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<ArticleBloc>(context)
                      .add(LoadArticleEvent(country: country));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "pl", child: Text("Poland")),
    const DropdownMenuItem(value: "de", child: Text("Germany")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

// const List<dynamic> list = [
//   {'Polish': 'Pl'},
//   'Two',
//   'Three',
//   'Four'
// ];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  static String dropdownValue = 'pl';

  static String getValue() {
    return dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        BlocProvider.of<ArticleBloc>(context)
            .add(LoadArticleEvent(country: value as String));
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      // items: list.map<DropdownMenuItem<String>>((dynamic value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Text(value),
      //   );
      // }).toList(),
      items: dropdownItems,
    );
  }
}
