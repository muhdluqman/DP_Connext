import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Mock order data and card for demonstration
class Order {
  final String id;
  final String customerName;
  final double amount;
  final String status;

  Order({
    required this.id,
    required this.customerName,
    required this.amount,
    required this.status,
  });
}

class CampaignOrderCard extends StatelessWidget {
  final Order order;

  const CampaignOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order #${order.id}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Customer: ${order.customerName}',
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            'Amount: \$${order.amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            'Status: ${order.status}',
            style: TextStyle(
              fontSize: 14.sp,
              color: order.status == 'Completed' ? Colors.green : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

// Sample orders data
final List<Order> orders = [
  Order(id: '001', customerName: 'John Doe', amount: 125.50, status: 'Completed'),
  Order(id: '002', customerName: 'Jane Smith', amount: 89.99, status: 'Pending'),
  Order(id: '003', customerName: 'Bob Johnson', amount: 245.00, status: 'Completed'),
  Order(id: '004', customerName: 'Alice Brown', amount: 67.75, status: 'Processing'),
  Order(id: '005', customerName: 'Charlie Wilson', amount: 199.99, status: 'Completed'),
];

class CampaignOrdersList extends StatelessWidget {
  const CampaignOrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 25.r),
      itemCount: orders.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final order = orders[index];
        return CampaignOrderCard(order: order);
      },
    );
  }
}