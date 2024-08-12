import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/daily_news/presentation/bloc/news_bloc.dart';
import 'package:news_app/feature/daily_news/presentation/widgets/news_list_widget.dart';
import 'package:news_app/feature/di/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsBloc bloc = sl();

  @override
  void initState() {
    super.initState();
    bloc.add(NewsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state) {
          case NewsInitial():
            return const SizedBox();

          case NewsLoading():
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );

          case NewsSuccess():
            return Scaffold(
              body: SafeArea(
                child: NewsListWidget(
                  articles: state.articles,
                ),
              ),
            );

          case NewsError():
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
        }
      },
    );
  }
}
