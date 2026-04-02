import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

import 'custom_dropdown.dart';
import 'medicine_model.dart';

class MedicineFormCard extends StatefulWidget {
  final Function(MedicineModel) onChanged;
  const MedicineFormCard({super.key,required this.onChanged,});

  @override
  State<MedicineFormCard> createState() => _MedicineFormCardState();
}

class _MedicineFormCardState extends State<MedicineFormCard> {

  String? dosage;
  String? period;
  String? timesPerDay;
  String? time;
  String? rules;
  String? startDate;
  String? duration;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.shade300),

        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(.05),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Medicine Details",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 12),

          /// CAMERA ICON
          Container(
            width: 80,
            height: 80,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: AppColors.primary),
            ),

            child: const Icon(Icons.photo_camera_outlined,size: 40,color: AppColors.tealContainer,),
          ),

          const SizedBox(height: 16),

          CustomDropdown(
            title: "Dosage",
            items: const ["1 Tablet","2 Tablets","5 ml"],
            value: dosage,
            onChanged: (v)=>setState(()=>dosage=v),
          ),

          CustomDropdown(
            title: "Period of Taking Medicine",
            items: const ["Before Eating","After Eating"],
            value: period,
            onChanged: (v)=>setState(()=>period=v),
          ),

          CustomDropdown(
            title: "How Many Times a Day",
            items: const ["1","2","3","4"],
            value: timesPerDay,
            onChanged: (v)=>setState(()=>timesPerDay=v),
          ),

          CustomDropdown(
            title: "Time to Take Medicine",
            items: const ["Morning","Afternoon","Night"],
            value: time,
            onChanged: (v)=>setState(()=>time=v),
          ),

          CustomDropdown(
            title: "Drinking Rules",
            items: const ["With Water","Without Water"],
            value: rules,
            onChanged: (v)=>setState(()=>rules=v),
          ),

          CustomDropdown(
            title: "Drinking Start Date",
            items: const ["Today","Tomorrow"],
            value: startDate,
            onChanged: (v)=>setState(()=>startDate=v),
          ),

          CustomDropdown(
            title: "Duration of Consumption",
            items: const ["3 Days","5 Days","7 Days"],
            value: duration,
            onChanged: (v)=>setState(()=>duration=v),
          ),

          const SizedBox(height: 12),

          const Text("Notes (Optional)"),

          const SizedBox(height: 6),

          TextField(

            decoration: InputDecoration(

              hintText: "Add your notes",

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

        ],
      ),
    );
  }
}