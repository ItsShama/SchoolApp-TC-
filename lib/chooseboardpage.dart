import 'package:flutter/material.dart';
import 'package:schoolapp/schooldetailpage.dart';
import 'package:schoolapp/loginpage.dart';

class ChooseBoardPage extends StatelessWidget {
  final String state;
  final String city;
  ChooseBoardPage({super.key, required this.state, required this.city});

  final Map<String, List<String>> schools = {
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double listViewHeight = screenHeight < 400 ? 180 : 250;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "CHOOSE BOARD",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon:
                const Icon(Icons.account_circle, size: 28, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: schools.keys.map((board) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    board,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: listViewHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: schools[board]!.length,
                      itemBuilder: (context, index) {
                        return SchoolCard(
                          schoolName: schools[board]![index],
                          state: state,
                          city: city,
                          schools: schools,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  final String schoolName;
  final String state;
  final String city;
  final Map<String, List<String>> schools;
  const SchoolCard(
      {super.key,
      required this.schoolName,
      required this.state,
      required this.city,
      required this.schools});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.8;

    return InkWell(
      onTap: () {
        String? selectedBoard;

        for (var board in schools.keys) {
          if (schools[board]!.contains(schoolName)) {
            selectedBoard = board;
            break;
          }
        }
        selectedBoard ??= "Unknown";

        List<String> schoolList = schools[selectedBoard] ?? [];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SchoolDetailPage(
              schoolName: schoolName,
              state: state,
              city: city,
              board: selectedBoard!,
              schoolList: schoolList,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1.5, color: Colors.grey.shade400)],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      schoolName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth < 400 ? 14 : 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.5),
                    ),
                    child: Icon(Icons.school,
                        color: Colors.black, size: screenWidth < 400 ? 18 : 26),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      " $city, $state",
                      style: TextStyle(
                          fontSize: screenWidth < 400 ? 16 : 15,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Courses Offered",
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade700),
                        ),
                        Text(
                          "Multiple Courses",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fees Range",
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade700),
                        ),
                        Text(
                          "1 L - 10 L",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    icon: const Icon(Icons.save_alt),
                  ),
                  Wrap(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: const Text(
                          "Brochure",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
