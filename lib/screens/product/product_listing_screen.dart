import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reference implementation showing the padding pattern used in ProductListingScreen
/// This demonstrates the consistent padding pattern that CampaignOrdersList should follow
class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        // This is the pattern that CampaignOrdersList should follow
        padding: EdgeInsets.fromLTRB(25.r, 0.r, 25.r, 25.r),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'Product $index',
              style: TextStyle(fontSize: 16.sp),
            ),
          );
        },
      ),
    );
  }
}