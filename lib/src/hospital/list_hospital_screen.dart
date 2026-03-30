import 'package:flutter/material.dart';
import 'package:medcare/src/hospital/widget/hospital_card_widget.dart';

import '../../../../utils/app_colors.dart';

class ListHospitalScreen extends StatelessWidget {
  const ListHospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, 0);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 16,
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 270,
                      decoration: BoxDecoration(
                        color: AppColors.containerBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.green),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.search, size: 20),
                          const SizedBox(width: 10),
                          Text(
                            'Search product or store',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 48,
                  width: 372,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Expanded(
                        flex: 3,
                        child: Text(
                          'Search Province',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down, size: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const HospitalCardWidget(
                  title: 'Ospeddale San Raffaele',
                  image: Image(
                    image: AssetImage('assets/hospital/hospital3.png'),
                    fit: BoxFit.contain,
                  ),
                  phone: '(+22) 123 456 789',
                  address: 'Via Olgettina, 60, 20132 Milano MI, Italy',
                ),
                const SizedBox(height: 20),
                const HospitalCardWidget(
                  title: 'Ospeddale San Raffaele',
                  image: Image(
                    image: AssetImage('assets/hospital/hospital3.png'),
                    fit: BoxFit.contain,
                  ),
                  phone: '(+22) 123 456 789',
                  address: 'Via Olgettina, 60, 20132 Milano MI, Italy',
                ),
                const SizedBox(height: 20),
                const HospitalCardWidget(
                  title: 'IRCCS Istituto Ortopedico Galeazzi',
                  image: Image(
                    image: AssetImage('assets/hospital/hospital3.png'),
                    fit: BoxFit.contain,
                  ),
                  phone: '(+22) 123 456 789',
                  address: 'Via Riccardo Galeazzi, 4, 20161 Milano MI,\n Italy',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
