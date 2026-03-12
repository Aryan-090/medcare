import 'package:flutter/material.dart';
class RegisterEmailWidget extends StatefulWidget {
  const RegisterEmailWidget({super.key});

  @override
  State<RegisterEmailWidget> createState() => _RegisterEmailWidgetState();
}

class _RegisterEmailWidgetState extends State<RegisterEmailWidget> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();

  String? gender;
  bool agree = false;

  Future<void> pickDate() async {

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dobController.text =
      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// EMAIL
          const Text("Email*"),

          const SizedBox(height: 8),

          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Enter email",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          /// FULL NAME
          const Text("Full name"),
          const SizedBox(height: 8),

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Enter your full name",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          /// GENDER
          const Text("Gender"),
          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            hint: const Text("Choose your gender"),
            value: gender,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: "Male", child: Text("Male")),
              DropdownMenuItem(value: "Female", child: Text("Female")),
              DropdownMenuItem(value: "Other", child: Text("Other")),
            ],
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),

          const SizedBox(height: 20),

          /// DOB
          const Text("Date of birth"),
          const SizedBox(height: 8),

          TextField(
            controller: dobController,
            readOnly: true,
            onTap: pickDate,
            decoration: const InputDecoration(
              hintText: "Enter your date of birth",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),

          const SizedBox(height: 10),

          /// CHECKBOX
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value!;
                  });
                },
              ),

              const Expanded(
                child: Text(
                  "You agree to receive information and notifications sent by MedCare",
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}