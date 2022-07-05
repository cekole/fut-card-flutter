import 'package:flutter/material.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({
    Key? key,
    required this.balance,
  }) : super(key: key);

  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, top: 4.0),
      color: Colors.black38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$balance',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(
            Icons.attach_money,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
