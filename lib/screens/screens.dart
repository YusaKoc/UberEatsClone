

import 'package:go_router/go_router.dart';
import 'package:uber_eats/Pages/main_page.dart';

import '../Pages/get_started_page.dart';

final GoRouter router = GoRouter(
    initialLocation: "/getstarted",
    routes: [
      GoRoute(path: '/getstarted',builder: (context, index) => const GetStarted(), ),
      GoRoute(path: '/mainpage',builder: (context, index) => const MainPage(), ),



]);