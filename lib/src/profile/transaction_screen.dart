import 'package:flutter/material.dart';
import 'package:medcare/src/profile/widgets/transaction_card.dart';

import '../../utils/app_colors.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Transaction"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back_ios_new_outlined),),
        backgroundColor: AppColors.background,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TransactionCard(
              title: 'GP Consultation with Dr. Emily Smith',
              amount: '\$20.00',
              date: '13',
              month: 'May',
            ),
            SizedBox(height: 10),
            TransactionCard(
              title: 'GP Consultation with Dr. Emily Smith',
              amount: '\$50.00',
              date: '05',
              month: 'May',
            ),
            SizedBox(height: 10),
            TransactionCard(
              title: 'GP Consultation with Dr. Emily Smith',
              amount: '\$20.00',
              date: '28',
              month: 'Mars',
            ),
          ],
        ),
      )
    );
  }
}
