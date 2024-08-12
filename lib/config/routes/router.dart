import 'package:go_router/go_router.dart';
import 'package:news_app/feature/daily_news/presentation/pages/home_page.dart';

GoRouter router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
  ],
);
