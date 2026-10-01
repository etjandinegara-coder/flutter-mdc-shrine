// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'package:mdc_100_series/model/product.dart';
import 'package:mdc_100_series/supplemental/backdrop.dart';
import 'package:mdc_100_series/supplemental/category_menu_page.dart';
import 'package:mdc_100_series/supplemental/cut_corners_border.dart';


const kShrinePink50 = Color(0xFFFEEAE6);
const kShrinePink100 = Color(0xFFFEDBD0);
const kShrinePink300 = Color(0xFFFBB8AC);
const kShrinePink400 = Color(0xFFEAA4A4);
const kShrineBrown900 = Color(0xFF442B2D);
const kShrineErrorRed = Color(0xFFC5032B);
const kShrineSurfaceWhite = Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
          currentCategory: _currentCategory,
          frontLayer: HomePage(
            category: _currentCategory,
          ),
          backLayer: CategoryMenuPage(
            currentCategory: _currentCategory,
            onCategoryTap: _onCategoryTap,
          ),
          frontTitle: const Text('SHRINE'),
          backTitle: const Text('MENU'),
        ),
      },
      theme: _buildShrineTheme(),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);

  return base.copyWith(
    colorScheme: const ColorScheme.light(
      primary: kShrineBrown900,
      onPrimary: kShrineSurfaceWhite,
      secondary: kShrineBrown900,
      onSecondary: kShrineSurfaceWhite,
      error: kShrineErrorRed,
      onError: kShrineSurfaceWhite,
      surface: kShrineSurfaceWhite,
      onSurface: kShrineBrown900,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    textTheme: _buildShrineTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: kShrinePink100,
      foregroundColor: kShrineBrown900,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: kShrinePink50,

      labelStyle: TextStyle(
        color: kShrineBrown900,
        fontSize: 14,
      ),

      floatingLabelStyle: TextStyle(
        color: kShrineBrown900,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),

      border: CutCornersBorder(
        borderSide: BorderSide(color: kShrineBrown900),
      ),

      enabledBorder: CutCornersBorder(
        borderSide: BorderSide(color: kShrineBrown900),
      ),

      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          color: kShrineBrown900,
          width: 2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kShrinePink100,
        foregroundColor: kShrineBrown900,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kShrineBrown900,
      ),
    ),
    cardTheme: const CardThemeData(
      color: kShrineSurfaceWhite,
      elevation: 0,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    displaySmall: base.displaySmall?.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: kShrineBrown900,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: kShrineBrown900,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kShrineBrown900,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontSize: 16,
      color: kShrineBrown900,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontSize: 14,
      color: kShrineBrown900,
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
      color: kShrineBrown900,
    ),
  );
}