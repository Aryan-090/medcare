import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MedicineDescriptionScreen extends StatelessWidget {
  const MedicineDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
                width: 372,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 18,
                        color: AppColors.black,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share, size: 18, color: AppColors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Image(
                  height: 185,
                  width: 233,
                  image: AssetImage('assets/medicine/bufect.png'),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Bufect Strip of 4 Tablets -Heat and Pain Relief Medicine",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Per Strip",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Start from',
                style: TextStyle(fontSize: 14, color: AppColors.disableText),
              ),
              const Text(
                '\$2,00',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: AppColors.grey, thickness: 1),
              const SizedBox(height: 10),
              const ProductDescription(
                heading: 'Product Description',
                description:
                    "Bufect is a reliable and effective medication presented in a convenient strip containing four tablets. Each tablet is meticulously formulated to provide targeted relief from various ailments. With its user-friendly packaging and easy-to-carry design, Bufect ensures quick access to relief whenever and wherever needed. Trust Bufect for fast-acting and dependable relief from discomfort.",
              ),
              const SizedBox(height: 10),
              const MedicineDescription(
                title: 'benefits',
                subtitle1:
                    'Provides fast and effective relief from pain \nand discomfort.',
                subtitle2:
                    'Suitable for a wide range of ailments, \nincluding headaches, muscle aches, fever, \nand menstrual cramps.',
                subtitle3:
                    'Each tablet is individually sealed for freshness \nand potency.',
              ),
              const MedicineDescription(
                title: 'Composition',
                subtitle1: 'Acetaminophen (500 mg)',
                subtitle2: 'Ibuprofen (200 mg)',
                subtitle3: 'Caffeine (50 mg)',
              ),
              const MedicineDescription(
                title: 'Dosage',
                subtitle1:
                    'Adults: Take 1 tablet every 4 to 6 hours as \nneeded. Do not exceed 4 tablets in 24 hours.',
                subtitle2:
                    'Children (ages 6-12): Take half a tablet every 4\n to 6 hours as needed. Do not exceed \n2 tablets in 24 hours.',
                subtitle3:
                    'Children under 6 years: Consult a healthcare \nprofessional before use.',
              ),
              const SizedBox(height: 10),
              const ProductDescription(
                heading: 'Storage Instruction',
                description:
                    'For optimal potency and safety, it is recommended to store this medication in a cool, dry place, away from direct sunlight. Exposure to excessive heat or moisture may compromise the quality of the product. ',
              ),
              const SizedBox(height: 10),
              const ProductDescription(
                heading: 'Storage Instruction',
                description:
                    'For optimal potency and safety, it is recommended to store this medication in a cool, dry place, away from direct sunlight. Exposure to excessive heat or moisture may compromise the quality of the product. Additionally, it is important to keep this medication out of reach of children and pets to prevent accidental ingestion and ensure their safety',
              ),
              const SizedBox(height: 10),
              const MedicineDescription(
                  title: 'Special Precaution',
                  subtitle1: 'Do not exceed the recommended dosage.',
                  subtitle2: 'Consult a healthcare professional before use\n if pregnant, breastfeeding, or taking \nother medications.',
                  subtitle3: 'Discontinue use and seek medical advice if\n adverse reactions occur.')
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineDescription extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  const MedicineDescription({
    super.key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.text,
          ),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Text(
              subtitle1,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.text,
              ),
            ),
          ],
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Text(
              subtitle2,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.text,
              ),
            ),
          ],
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Text(
              subtitle3,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String heading;
  final String description;

  const ProductDescription({
    super.key,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.text,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }
}
