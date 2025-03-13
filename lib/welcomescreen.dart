import 'package:flutter/material.dart';
import 'package:schoolapp/chooseboardpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? selectedState;
  String? selectedCity;

  final List<String> states = ["Maharashtra", "Gujarat"];
  final Map<String, List<String>> cities = {
    "Maharashtra": ["Mumbai", "Pune"],
    "Gujarat": ["Ahmedabad", "Surat"]
  };

  void validateAndNavigate() {
    if (selectedState != null && selectedCity != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseBoardPage(
            state: selectedState!,
            city: selectedCity!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select both fields!"),
          backgroundColor: Colors.purple,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            "WELCOME USER",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButtonFormField<String>(
                value: selectedState,
                hint: const Text("Select Your State"),
                items: states
                    .map((state) => DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                    selectedCity = null;
                  });
                },
                decoration: dropdownDecoration(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButtonFormField<String>(
                value: selectedCity,
                hint: const Text("Select Your City"),
                items: (selectedState != null)
                    ? cities[selectedState]!
                        .map((city) => DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            ))
                        .toList()
                    : [],
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                decoration: dropdownDecoration(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onPressed: validateAndNavigate,
                child: const Text("Find",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.pink[50],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
