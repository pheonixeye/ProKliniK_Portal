import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portal/pages/homepage/homepage.dart';
import 'package:portal/pages/loading_root_page/loading_root_page.dart';
import 'package:portal/providers/locale_px.dart';
import 'package:provider/provider.dart';

const _langs = ["en", 'ar'];

/// GoRouter configuration
final router = GoRouter(
  refreshListenable: PxLocale(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return LoadingRootPage(
          key: state.pageKey,
        );
      },
      redirect: (context, state) {
        if (state.pathParameters.isEmpty) {
          context.read<PxLocale>().setLang("en");
          return "/en";
        } else if (state.pathParameters['lang'] != null &&
            (!_langs.contains(state.pathParameters['lang']))) {
          return "/en";
        }
        return null;
      },
      routes: [
        GoRoute(
          name: "home",
          path: ':lang',
          builder: (context, state) {
            final lang = state.pathParameters["lang"] as String;
            final langKey = ValueKey(lang);
            context.read<PxLocale>().setLang(lang);
            return HomePage(
              key: langKey,
            );
          },
        ),
      ],
    ),
  ],
);
