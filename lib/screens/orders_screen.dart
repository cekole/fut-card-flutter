import 'package:flutter/material.dart';
import 'package:fut_card/providers/orders.dart' show Orders;
import 'package:fut_card/widgets/order_item.dart';
import 'package:fut_card/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: orderData.orders.isEmpty
          ? const Center(
              child: Text(
                'No Orders Made Yet',
                style: TextStyle(fontSize: 25),
              ),
            )
          : ListView.builder(
              itemBuilder: ((context, index) => OrderItem(
                    order: orderData.orders[index],
                  )),
              itemCount: orderData.orders.length,
            ),
    );
  }
}
