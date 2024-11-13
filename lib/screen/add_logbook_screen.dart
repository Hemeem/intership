import 'package:flutter/material.dart';
import '../widgets/logbook/addlogbook/activity_description_input_field.dart';
import '../widgets/logbook/addlogbook/date_and_title_input_field.dart';
import '../widgets/logbook/addlogbook/documentation_input_field.dart';
import '../widgets/logbook/addlogbook/progress_indicator.dart';

class AddLogbookScreen extends StatefulWidget {
  @override
  _AddLogbookScreenState createState() => _AddLogbookScreenState();
}

class _AddLogbookScreenState extends State<AddLogbookScreen> {
  int currentStep = 1;

  void nextStep() {
    setState(() {
      if (currentStep < 3) currentStep++;
    });
  }

  void previousStep() {
    setState(() {
      if (currentStep > 1) currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  "Logbook",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "September, 10",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  "Hammam, Ayo Isi Logbook Hari Ini",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 40),
                ProgressIndicatorWidget(currentStep: currentStep),
                SizedBox(height: 20),
                if (currentStep == 1) DateAndTitleInputField(),
                if (currentStep == 2) ActivityDescriptionInputField(),
                if (currentStep == 3) DocumentationInputField(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentStep > 1)
                      ElevatedButton(
                        onPressed: previousStep,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF76C7C0),
                        ),
                        child: Text("Kembali"),
                      ),
                    ElevatedButton(
                      onPressed: currentStep == 3 ? null : nextStep,
                      style: ElevatedButton.styleFrom(
                        primary:
                            currentStep == 3 ? Colors.grey : Color(0xFF76C7C0),
                      ),
                      child: Text(currentStep == 3 ? "Simpan" : "Lanjut"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Color(0xFF76C7C0),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              mini: true,
            ),
          ),
        ],
      ),
    );
  }
}
