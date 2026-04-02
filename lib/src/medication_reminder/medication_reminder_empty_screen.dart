import 'package:flutter/material.dart';
import 'package:medcare/src/medication_reminder/widget/date_item_widget.dart';
import 'package:medcare/src/medication_reminder/widget/medicine_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/button/primary_button_widget.dart';
import 'drug_details_screen.dart';
import 'widget/medicine_list_card.dart';

class MedicationReminderEmptyScreen extends StatefulWidget {
  const MedicationReminderEmptyScreen({super.key});

  @override
  State<MedicationReminderEmptyScreen> createState() =>
      _MedicationReminderEmptyScreenState();
}

class _MedicationReminderEmptyScreenState
    extends State<MedicationReminderEmptyScreen> {

  int selectedIndex = 1;

  /// list of medicines
  List<MedicineModel> medicines = [];

  final List<Map<String, String>> months = [
    {'month': 'January'},
    {'month': 'February'},
    {'month': 'March'},
    {'month': 'April'},
    {'month': 'May'},
    {'month': 'June'},
    {'month': 'July'},
    {'month': 'August'},
    {'month': 'September'},
    {'month': 'October'},
    {'month': 'November'},
    {'month': 'December'},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(

            children: [

              /// TOP BAR
              Row(
                children: [

                  IconButton(
                    onPressed: () => Navigator.pop(context),

                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'Medication Reminder',

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                ],
              ),

              /// MONTH SELECTOR
              Row(
                children: [

                  IconButton(

                    onPressed: () {
                      setState(() {

                        selectedIndex =
                            (selectedIndex - 1 + months.length) %
                                months.length;

                      });
                    },

                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 14,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    months[selectedIndex]['month']!,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  IconButton(

                    onPressed: () {
                      setState(() {

                        selectedIndex =
                            (selectedIndex + 1) % months.length;

                      });
                    },

                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 14,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 20),

              /// DATE LIST
              SizedBox(
                height: 65,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: const [

                    DateItem(day: "Wed", date: "22"),
                    DateItem(day: "Thu", date: "23"),
                    DateItem(day: "Fri", date: "24"),
                    DateItem(day: "Sat", date: "25"),
                    DateItem(day: "Sun", date: "26"),
                    DateItem(day: "Mon", date: "27"),

                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Today, 20 February 2024",

                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              /// SHOW LIST OR EMPTY UI
              Expanded(

                child: medicines.isEmpty

                /// EMPTY UI
                    ? Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Image.asset(
                      "assets/img/medication_empty.png",
                      height: 150,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "No medication scheduled for today",

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Click add medicine below to add a schedule",

                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                )

                /// MEDICINE LIST
                    : ListView.builder(

                  itemCount: medicines.length,

                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),

                      child: MedicineListCard(
                        medicine: medicines[index],
                      ),
                    );
                  },
                ),
              ),

              /// ADD BUTTON
              PrimaryButtonWidget(

                title: "Add Medicine",

                width: double.infinity,

                radius: 30,

                onTap: () async {

                  final result = await Navigator.push(

                    context,

                    MaterialPageRoute(
                      builder: (_) => const DrugDetailsScreen(),
                    ),
                  );

                  /// if user saved medicine
                  if(result != null){

                    setState(() {

                      medicines.add(result);

                    });

                  }

                },
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

