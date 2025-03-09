import 'package:flutter/material.dart';

class SchoolDetailPage extends StatefulWidget {
  final String schoolName;

  const SchoolDetailPage({super.key, required this.schoolName});

  @override
  _SchoolDetailPageState createState() => _SchoolDetailPageState();
}

class _SchoolDetailPageState extends State<SchoolDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    height: screenWidth < 400 ? 180 : 250,
                    width: double.infinity,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Text(
                      "School Banner Image",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Flexible(
                          // Allows text to wrap inside Row
                          child: Text(
                            widget.schoolName,
                            style: TextStyle(
                              fontSize: screenWidth < 400 ? 12 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            softWrap: true, // Enable text wrapping
                            overflow:
                                TextOverflow.visible, // Ensures full visibility
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: screenWidth < 400 ? 18 : 24,
                              ),
                              Text(
                                " Kalkaji, Delhi",
                                style: TextStyle(
                                  fontSize: screenWidth < 400 ? 12 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: Colors.black,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: screenWidth < 400 ? 18 : 24,
                              ),
                              Text(
                                " 4.2/5 Reviews",
                                style: TextStyle(
                                  fontSize: screenWidth < 400 ? 12 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: Colors.black,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.comment,
                                color: Colors.black,
                                size: screenWidth < 400 ? 18 : 24,
                              ),
                              Text(
                                " Comments",
                                style: TextStyle(
                                  fontSize: screenWidth < 400 ? 12 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Chip(
                        label: const Text(
                          "Private Institute",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Chip(
                        label: const Text(
                          "Estd. 1995",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                ),

                // Compare & Brochure Buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.compare,
                            color: Colors.white,
                            size: screenWidth < 400 ? 18 : 24,
                          ),
                          label: Text(
                            "Compare",
                            style: TextStyle(
                              fontSize: screenWidth < 400 ? 14 : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth < 400 ? 5 : 20,
                              vertical: screenWidth < 400 ? 8 : 16,
                            ),
                            minimumSize: Size(0, screenWidth < 400 ? 36 : 48),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth < 400 ? 6 : 15),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.file_download,
                            color: Colors.white,
                            size: screenWidth < 400 ? 18 : 24,
                          ),
                          label: Text(
                            "Brochure",
                            style: TextStyle(
                              fontSize: screenWidth < 400 ? 14 : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth < 400 ? 5 : 20,
                              vertical: screenWidth < 400 ? 8 : 16,
                            ),
                            minimumSize: Size(0, screenWidth < 400 ? 36 : 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Tab Bar
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: const <Widget>[
                    Tab(icon: Icon(Icons.info), text: "Overview"),
                    Tab(icon: Icon(Icons.comment), text: "Review"),
                    Tab(icon: Icon(Icons.attach_money), text: "Fees"),
                    Tab(icon: Icon(Icons.school), text: "Admissions"),
                    Tab(icon: Icon(Icons.business), text: "Facilities"),
                    Tab(icon: Icon(Icons.bar_chart), text: "Ranking"),
                  ],
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent("Overview: The school is..."),
                _buildTabContent("Review & Ratings: ..."),
                _buildTabContent("Fee Structure"),
                _buildTabContent("Admissions: ..."),
                _buildTabContent("Facilities: ..."),
                _buildTabContent("Ranking: ..."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String content) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
