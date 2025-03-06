import 'package:flutter/material.dart';
import 'package:schoolapp/schooldetailpage.dart';

class ChooseBoardPage extends StatelessWidget {
  final Map<String, List<String>> boardSchools = {
    "SSC Board": [
      "St. Xavier's High School, Mumbai",
      "Don Bosco High School, Matunga",
      "Smt. Sulochanadevi Singhania School, Thane",
      "Bombay Scottish School, Mahim",
      "Dhirubhai Ambani International School, Mumbai"
    ],
    "CBSE Board": [
      "Delhi Public School, R.K. Puram, New Delhi",
      "Kendriya Vidyalaya, IIT Bombay, Mumbai",
      "The Mother's International School, New Delhi",
      "National Public School, Bangalore",
      "Chinmaya Vidyalaya, Chennai"
    ],
    "ICSE Board": [
      "Cathedral and John Connon School, Mumbai",
      "La Martiniere for Boys, Kolkata",
      "Bishop Cotton Boys' School, Bangalore",
      "Campion School, Mumbai",
      "St. Joseph's College, Nainital"
    ],
    "CAIE Board": [
      "The British School, New Delhi",
      "Dhirubhai Ambani International School, Mumbai",
      "Pathways World School, Gurgaon",
      "Good Shepherd International School, Ooty",
      "Ecole Mondiale World School, Mumbai"
    ]
  };

  ChooseBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "CHOOSE  BOARD",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: boardSchools.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key, // Board Name
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 schools per row
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 2, // Adjust box size
                    ),
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchoolDetailPage(
                                schoolName: entry.value[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              entry.value[index], // School Name
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
