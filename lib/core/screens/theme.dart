import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vega_tokens/vega_tokens.dart';

const primaryColor = VegaColors.digital800;

ThemeData appTheme() => ThemeData(
      useMaterial3: true,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
        ),
      ),
      searchBarTheme: const SearchBarThemeData(
        textStyle: WidgetStatePropertyAll(VegaSemanticTypographies.bodyMediumS),
        hintStyle:
            WidgetStatePropertyAll(VegaSemanticTypographies.bodyRegularS),
        surfaceTintColor: WidgetStatePropertyAll(Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor),
          minimumSize: const Size(0, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          splashFactory: InkRipple.splashFactory,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.black54,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(color: Color(0x1f000000)),
      navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme: IconThemeData(color: primaryColor),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStatePropertyAll(Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: primaryColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      fontFamily: 'Calibre-R',
      iconTheme: const IconThemeData(color: primaryColor, size: 30),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor.withAlpha(51),
        selectionHandleColor: primaryColor,
      ),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        // shadowColor: Color(0xAA000000),
        margin: EdgeInsets.symmetric(vertical: 4),
        elevation: 2,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFfed369)),
    );
