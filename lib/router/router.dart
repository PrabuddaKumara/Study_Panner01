import 'package:c01/models/add-course-model.dart';
import 'package:c01/pages/add-new-course.dart';
import 'package:c01/pages/main_page.dart';
import 'package:c01/pages/single-course.dart';
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
      GoRoute(
        path: "/add-new-course",
        name: "add-new-course",
        builder: (context, state) {
          return AddNewCourse();
        },
      ),
      GoRoute(
        path: "/single-course",
        name: "single-course",
        builder: (context, state) {
          final CourseModel course=state.extra as CourseModel;

          return SingleCourse(
            course: course,
          );
        },
      ),
    ],
  );
}
