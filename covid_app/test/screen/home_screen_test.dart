import 'package:covid_app/screens/home_screen.dart';
import 'package:covid_app/screens/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  const path = HomeScreen();

  testWidgets('Judul Halaman', (WidgetTester tester) async {

    await tester.pumpWidget(path);

    expect(find.byWidget(const InfoScreen()), findsOneWidget);
  });
  // testWidgets('Judul Halaman', (WidgetTester tester) async {

  //   await tester.pumpWidget(path);

  //   expect(find.text('Contacts'), findsOneWidget);
  // });
  // testWidgets('Badan halaman terdapat List of Contact', (WidgetTester tester) async {

  //   await tester.pumpWidget(path);

  //   expect(find.byKey(const ValueKey("List Contact")), findsOneWidget);
  // });
  // testWidgets('Button Create Contact', (WidgetTester tester) async {

  //   await tester.pumpWidget(path);

  //   expect(find.widgetWithIcon(FloatingActionButton, Icons.person_add_alt_rounded), findsOneWidget);
  // });
}