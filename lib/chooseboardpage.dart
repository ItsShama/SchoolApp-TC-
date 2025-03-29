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
    double listViewHeight =
    screenHeight < 400 ? screenHeight * 0.30 : screenHeight * 0.55;

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

  const SchoolCard({
    super.key,
    required this.schoolName,
    required this.state,
    required this.city,
    required this.schools,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.8;
    double screenHeight = MediaQuery.of(context).size.height;
    double listViewHeight =
    screenHeight < 400 ? screenHeight * 0.30 : screenHeight * 0.55;

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
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: const Icon(Icons.image, size: 50, color: Colors.white),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.bookmark_border, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    schoolName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth < 400 ? 14 : 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      // Ranking before stars
                      Text("Ranking: #5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black)),
                      const SizedBox(width: 8),
                      // Stars
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star,
                              color: Colors.amber, size: 16);
                        }),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Classes: Pre-Nursery - Class 10",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text("Multiple Courses",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fees Range",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("1 L - 10 L", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.black),
                      const SizedBox(width: 5),
                      Text("$city, $state",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          minimumSize: const Size(180, 45),
                        ),
                        icon: const Icon(Icons.download,
                            color: Colors.white, size: 22),
                        label: const Text("Brochure",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}