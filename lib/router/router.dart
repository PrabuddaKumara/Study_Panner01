import 'package:c01/models/add-course-model.dart';
import 'package:c01/pages/add-new-assiment.dart';
import 'package:c01/pages/add-new-course.dart';
import 'package:c01/pages/add-new-note.dart';
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
          final CourseModel course = state.extra as CourseModel;

          return SingleCourse(course: course);
        },
      ),
      GoRoute(
        path: "/add-new-assiment",
        name: "add-new-assiment",
        builder: (context, state) {
          final CourseModel cou = state.extra as CourseModel;
          return AddNewAssiment(course: cou);
        },
      ),
      GoRoute(
        path: "/add-new-note",
        name: "add-new-note",
        builder: (context, state) {
          final CourseModel cour = state.extra as CourseModel;
          return AddNewNotes(course: cour);
        },
      ),
    ],
  );
}
