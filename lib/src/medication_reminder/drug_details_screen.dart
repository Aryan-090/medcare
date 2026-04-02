import 'package:flutter/material.dart';
import 'package:medcare/src/medication_reminder/widget/medicine_form_card.dart';
import 'package:medcare/src/medication_reminder/widget/medicine_info_card.dart';
import 'package:medcare/src/medication_reminder/widget/medicine_model.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../services/widgets/notification_toggle.dart';
import 'medication_reminder_empty_screen.dart';

class DrugDetailsScreen extends StatefulWidget {
  const DrugDetailsScreen({super.key});

  @override
  State<DrugDetailsScreen> createState() => _DrugDetailsScreenState();
}

class _DrugDetailsScreenState extends State<DrugDetailsScreen> {

  bool notification = true;

  MedicineModel? medicineData;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(

            children: [

              /// APP BAR
              Row(
                children: [

                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),

                  const SizedBox(width: 50),

                  const Text(
                    "Details About the Drug",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),

                  const Spacer(),

                ],
              ),

              const SizedBox(height: 16),

              /// GREEN CARD
              const MedicineInfoCard(),

              const SizedBox(height: 16),

              /// FORM
              Expanded(
                child: SingleChildScrollView(

                  child: Column(

                    children: [

                       MedicineFormCard(

                        onChanged: (data){

                          medicineData = data;

                        },
                      ),

                      const SizedBox(height: 16),

                      const NotificationToggle(),

                      const SizedBox(height: 18),


                      PrimaryButtonWidget(

                        title: "Save",

                        onTap: () {

                          Navigator.pop(

                            context,

                            medicineData ??
                                MedicineModel(
                                  name: "Paracetamol 500 mg",
                                  dosage: "1 Caplet",
                                  time: "After meal",
                                ),
                          );

                        },
                      )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}