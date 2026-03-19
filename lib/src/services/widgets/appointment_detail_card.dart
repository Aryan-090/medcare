import 'package:flutter/material.dart';

class AppointmentDetailCard extends StatelessWidget {
  final String dateTime;
  final String clinic;
  final String address;

  const AppointmentDetailCard({
    super.key,
    required this.dateTime,
    required this.clinic,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          const Text(
            "Detail Appointment",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 10),

          const Divider(),

          const SizedBox(height: 10),

          /// DATE
          const Text("Date & Time", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(dateTime),

          const SizedBox(height: 12),

          /// LOCATION
          const Text("Location", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(clinic),
                    Text(
                      address,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Text(
                "See Maps",
                style: TextStyle(color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }
}