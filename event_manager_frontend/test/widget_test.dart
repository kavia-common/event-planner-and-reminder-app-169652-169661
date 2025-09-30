import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_manager_frontend/main.dart';

void main() {
  testWidgets('EventManagerApp shows loading indicator during initialization',
      (WidgetTester tester) async {
    await tester.pumpWidget(const EventManagerApp());

    // Initially shows loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for initialization
    await tester.pump();
  });

  testWidgets('EventManagerApp initializes with correct tab navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const EventManagerApp());
    await tester.pumpAndSettle();

    // Verify bottom navigation tabs exist
    expect(find.text('Events'), findsOneWidget);
    expect(find.text('Birthdays'), findsOneWidget);
    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Verify tab icons
    expect(find.byIcon(Icons.event), findsOneWidget);
    expect(find.byIcon(Icons.cake), findsOneWidget);
    expect(find.byIcon(Icons.chat), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('EventManagerApp has correct theme', (WidgetTester tester) async {
    await tester.pumpWidget(const EventManagerApp());
    await tester.pumpAndSettle();

    final MaterialApp app = find.byType(MaterialApp).evaluate().last.widget as MaterialApp;
    expect(app.debugShowCheckedModeBanner, false);
    expect(app.title, 'Event Manager');
  });
}
