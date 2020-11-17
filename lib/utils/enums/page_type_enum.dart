import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/genres_provider.dart';
import '../../providers/bottom_nav_bar_provider.dart';

import '../../ui/screens/login_screen.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/primary/book_collections_screen.dart';
import '../../ui/screens/primary/genre_books_screen.dart';
import '../../ui/screens/primary/authors_gallery_screen.dart';
import '../../ui/screens/primary/member_profile_screen.dart';
import '../../ui/screens/primary/member_bookshelf_screen.dart';
import '../../ui/screens/secondary/author_details_screen.dart';
import '../../ui/screens/secondary/book_details_screen.dart';

enum PageType {
  HOME,
  COLLECTIONS,
  GENRES,
  AUTHOR,
  BOOK,
  BOOKSHELF,
  AUTHORGALLERY,
  PROFILE,
  LOGIN
}

extension ActivePage on PageType {
  String get name => describeEnum(this);

  Widget getRoute() {
    switch (this) {
      case PageType.HOME:
        return ChangeNotifierProvider(
          create: (_) => BottomNavBarProvider(),
          child: HomeScreen(),
        );
      case PageType.COLLECTIONS:
        return BookCollectionsScreen();
      case PageType.GENRES:
        return ChangeNotifierProvider(
          create: (_) => GenresProvider(),
          child: GenreBooksScreen(),
        );
      case PageType.AUTHOR:
        return AuthorDetailsScreen();
      case PageType.AUTHORGALLERY:
        return AuthorsGalleryScreen();
      case PageType.BOOK:
        return BookDetailsScreen();
      case PageType.BOOKSHELF:
        return MemberBookshelfScreen();
      case PageType.PROFILE:
        return MemberProfileScreen();
      case PageType.LOGIN:
        return LoginScreen();
      default:
        return BookCollectionsScreen();
    }
  }
}
