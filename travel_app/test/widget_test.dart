// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/buttonWidget.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/signUp.dart';

void main() {
  testWidgets("test login widget", (WidgetTester tester) async {
    final addField = find.byKey(ValueKey("email"));
    final addTxt = find.byKey(ValueKey("password"));
    final addButton = find.byType(ButtonWidget);
    await tester.pumpWidget(MaterialApp(home: MyLogin()));
    await tester.enterText(addField, "x@y.com");
    await tester.enterText(addTxt, "asdfghj");
    await tester.tap(addButton);
    await tester.pump();
    expect(find.text("x@y.com"), findsOneWidget);
    expect(find.text("asdfghj"), findsOneWidget);
  });
}
