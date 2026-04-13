import 'package:flutter/material.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/horizontal_product_list.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/section_title.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import '../../../utils/app_colors.dart';
import '../../service_screen/widgets/review_card.dart';

class MedicineDescriptionScreen extends StatefulWidget {
  final Map<String, String> medicine;

  const MedicineDescriptionScreen({super.key, required this.medicine});

  @override
  State<MedicineDescriptionScreen> createState() =>
      _MedicineDescriptionScreenState();
}

class _MedicineDescriptionScreenState extends State<MedicineDescriptionScreen> {
  final ScrollController scrollController = ScrollController();

  final GlobalKey descriptionKey = GlobalKey();
  final GlobalKey detailsKey = GlobalKey();
  final GlobalKey reviewKey = GlobalKey();

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      double descriptionPosition = _getPosition(descriptionKey);
      double detailsPosition = _getPosition(detailsKey);
      double reviewPosition = _getPosition(reviewKey);

      if (scrollController.offset >= reviewPosition - 200) {
        setState(() => selectedTab = 2);
      } else if (scrollController.offset >= detailsPosition - 200) {
        setState(() => selectedTab = 1);
      } else {
        setState(() => selectedTab = 0);
      }
    });
  }

  double _getPosition(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;

    return box.localToGlobal(Offset.zero).dy + scrollController.offset;
  }

  Widget tabItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        GlobalKey targetKey;

        if (index == 0) {
          targetKey = descriptionKey;
        } else if (index == 1) {
          targetKey = detailsKey;
        } else {
          targetKey = reviewKey;
        }

        Scrollable.ensureVisible(
          targetKey.currentContext!,
          duration: const Duration(milliseconds: 400),
        );
      },

      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color:
                  selectedTab == index
                      ? AppColors.primary
                      : AppColors.disableText,
            ),
          ),

          const SizedBox(height: 5),

          Container(
            height: 2,
            width: 70,
            color:
                selectedTab == index ? AppColors.primary : Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final medicine = widget.medicine;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,

              padding: const EdgeInsets.all(15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(
                    height: 24,
                    width: 372,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 18,
                            color: AppColors.black,
                          ),
                        ),

                        const Spacer(),

                        Icon(
                          Icons.share,
                          size: 18,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Image(
                      height: 185,
                      width: 233,
                      image: AssetImage(medicine["image"]!),
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    medicine["title"]!,
                    style: const TextStyle(
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
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.disableText,
                    ),
                  ),

                  Text(
                    '${medicine["price"]}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Divider(color: AppColors.grey, thickness: 1),

                  const SizedBox(height: 10),

                  /// TAB HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      tabItem("Description", 0),

                      tabItem("Details", 1),

                      tabItem("Reviews", 2),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  Container(
                    key: descriptionKey,

                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        ProductDescription(
                          heading: 'Product Description',
                          description:
                              "Bufect is a reliable and effective medication presented in a convenient strip containing four tablets. Each tablet is meticulously formulated to provide targeted relief from various ailments. With its user-friendly packaging and easy-to-carry design, Bufect ensures quick access to relief whenever and wherever needed. Trust Bufect for fast-acting and dependable relief from discomfort.",
                        ),

                        SizedBox(height: 10),

                        MedicineDescription(
                          title: 'benefits',
                          subtitle1:
                              'Provides fast and effective relief from pain \nand discomfort.',
                          subtitle2:
                              'Suitable for a wide range of ailments, \nincluding headaches, muscle aches, fever, \nand menstrual cramps.',
                          subtitle3:
                              'Each tablet is individually sealed for freshness \nand potency.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DETAILS
                  Container(
                    key: detailsKey,

                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        MedicineDescription(
                          title: 'Composition',
                          subtitle1: 'Acetaminophen (500 mg)',
                          subtitle2: 'Ibuprofen (200 mg)',
                          subtitle3: 'Caffeine (50 mg)',
                        ),

                        SizedBox(height: 10),

                        MedicineDescription(
                          title: 'Dosage',
                          subtitle1:
                              'Adults: Take 1 tablet every 4 to 6 hours as needed. Do not exceed 4 tablets in 24 hours.',
                          subtitle2:
                              'Children (ages 6-12): Take half a tablet every 4 to 6 hours as needed.',
                          subtitle3:
                              'Children under 6 years: Consult a healthcare professional before use.',
                        ),

                        SizedBox(height: 10),

                        ProductDescription(
                          heading: 'Storage Instruction',
                          description:
                              'For optimal potency and safety, store in a cool, dry place away from sunlight.',
                        ),

                        SizedBox(height: 10),

                        ProductDescription(
                          heading: 'Storage Instruction',
                          description:
                              'Keep this medication out of reach of children and pets.',
                        ),

                        SizedBox(height: 10),

                        MedicineDescription(
                          title: 'Special Precaution',
                          subtitle1: 'Do not exceed the recommended dosage.',
                          subtitle2:
                              'Consult doctor if pregnant or breastfeeding.',
                          subtitle3:
                              'Discontinue use if adverse reactions occur.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// REVIEWS
                  Container(
                    key: reviewKey,

                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Review',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.text,
                          ),
                        ),

                        SizedBox(height: 10),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ReviewCard(),
                              ReviewCard(),
                              ReviewCard(),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),

                        SectionHeader(title: "Related Products"),

                        SizedBox(height: 10),

                        HorizontalProductList(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 70),
                ],
              ),
            ),

            /// FLOATING BUTTON
            Positioned(
              left: 10,
              right: 10,
              bottom: 20,

              child: SizedBox(
                width: double.infinity,
                height: 50,

                child: PrimaryButtonWidget(
                  onTap: () {},

                  title: 'Add To Cart',

                  width: double.infinity,
                ),
              ),
            ),
          ],
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
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                subtitle1,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),

        Row(
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                subtitle2,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),

        Row(
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                subtitle3,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.text,
                ),
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

      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.text,
          ),
        ),

        const SizedBox(height: 10),

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
