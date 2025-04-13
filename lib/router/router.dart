import 'package:c01/main_page.dart';
import 'package:go_router/go_router.dart';

class Gorouter {
  final router = GoRouter(
    initialLocation: "/",

    routes: [
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) {
          return MainPage();
        },
      ),
    ],
  );
}
