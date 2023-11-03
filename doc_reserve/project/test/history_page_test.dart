import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';

void main() {
  testWidgets('HistoryPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('History'), findsOneWidget);
    expect(find.text('Docs Reservations'), findsOneWidget);

    expect(find.byIcon(Icons.person), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsNothing);

    await tester.runAsync(() async {});

    expect(find.byType(Card), findsWidgets);
    expect(find.text('Name: Your Reservation Name'), findsOneWidget);
    expect(find.text('Date: Your Reservation Date'), findsOneWidget);
    expect(find.text('Time: Your Reservation Time'), findsOneWidget);
    expect(
        find.text('Description: Your Reservation Description'), findsOneWidget);

    await tester.tap(find.text('Edit'));
    await tester.pumpAndSettle();
    expect(find.text('Edit Reservation'), findsOneWidget);
  });
}
