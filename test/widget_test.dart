import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:magicstationqrgen/main.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Smoke test', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(720, 1280));

    await tester.pumpWidget(MyApp());

    final title = 'Magic Station QR';

    expect(find.text(title), findsOneWidget);

    await tester.tap(find.byIcon(Icons.autorenew));
    await tester.pump();

    expect(find.text(title), findsNothing);
    expect(findTextWidgetWithPrefix('DAI-0001-'), findsOneWidget);
  });
}

Finder findTextWidgetWithPrefix(String prefix) => find.byWidgetPredicate(
    (w) => (w is Text && w.data != null && w.data.startsWith(prefix)));
