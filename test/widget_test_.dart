import 'package:flutter_test/flutter_test.dart';
import 'package:gto_ai/main.dart';

void main() {
  testWidgets('GTO AI app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const GTOApp());

    expect(find.text('GTO AI'), findsOneWidget);
  });
}
