import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dp_connext/screens/campaign/widgets/campaign_dashboard_widgets.dart';

void main() {
  group('CampaignOrdersList Tests', () {
    testWidgets('should have proper padding configuration', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              home: Scaffold(
                body: const CampaignOrdersList(),
              ),
            );
          },
        ),
      );

      // Find the ListView widget
      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);

      // Get the ListView widget
      final ListView listView = tester.widget(listViewFinder);
      
      // Check the current padding - this test documents the current state
      // Before fix: EdgeInsets.symmetric(horizontal: 20.r) -> EdgeInsets.only(left: 20.0, right: 20.0)
      // After fix: EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 25.r) -> EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0)
      
      if (listView.padding != null) {
        final EdgeInsets padding = listView.padding as EdgeInsets;
        
        // These assertions will initially pass with the problematic implementation
        expect(padding.left, equals(20.0));
        expect(padding.right, equals(20.0));
        expect(padding.top, equals(0.0));
        
        // This assertion will fail initially (bottom padding is 0, should be 25)
        // After fix, this should pass
        expect(padding.bottom, equals(25.0), reason: 'Bottom padding should be 25.0 to prevent items from extending to screen edge');
      }
    });

    testWidgets('should render campaign order cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              home: Scaffold(
                body: const CampaignOrdersList(),
              ),
            );
          },
        ),
      );

      // Verify that order cards are rendered
      expect(find.byType(CampaignOrderCard), findsWidgets);
      
      // Verify that we have the expected number of orders
      expect(find.byType(CampaignOrderCard), findsNWidgets(5));
    });
  });
}