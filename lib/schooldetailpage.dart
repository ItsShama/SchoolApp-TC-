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
  Map<int, bool> _isExpandedMap = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedTabIndex = 0;
  List<String> _getTabContentItems() {
    switch (_selectedTabIndex) {
      case 0:
        return [
          "Introduction",
          "Facilities Overview",
          "Curriculum Details",
          "Faculty Information",
          "Student Achievements",
          "Campus Life"
        ];
      case 1:
        return [
          "User Reviews",
          "Rating Breakdown",
          "Top Positive Reviews",
          "Top Negative Reviews",
          "Feedback Trends"
        ];
      case 2:
        return [
          "Fee Structure",
          "Scholarship Options",
          "Payment Methods",
          "Late Fee Policy",
          "Additional Costs"
        ];
      case 3:
        return [
          "Admission Process",
          "Eligibility Criteria",
          "Required Documents",
          "Important Dates",
          "Application Procedure"
        ];
      case 4:
        return [
          "Library",
          "Laboratories",
          "Sports Complex",
          "Hostel Accommodation",
          "Cafeteria"
        ];
      case 5:
        return [
          "National Ranking",
          "State Ranking",
          "Past Year Trends",
          "Student Placement Records",
          "Alumni Success Stories"
        ];
      default:
        return [];
    }
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
      body: SingleChildScrollView(
        child: Column(
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
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                            child: Text(
                              widget.schoolName,
                              style: TextStyle(
                                fontSize: screenWidth < 400 ? 16 : 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
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
                      Tab(icon: Icon(Icons.info), text: "School Info"),
                      Tab(icon: Icon(Icons.comment), text: "Review"),
                      Tab(icon: Icon(Icons.attach_money), text: "Fees"),
                      Tab(icon: Icon(Icons.school), text: "Admissions"),
                      Tab(icon: Icon(Icons.business), text: "Faculty"),
                      Tab(icon: Icon(Icons.bar_chart), text: "Ranking"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: TabBarView(
                controller: _tabController,
                children: List.generate(6, (index) {
                  return _buildTabContent(_getTabContentItems());
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(List<String> items) {
    bool isExpanded = _isExpandedMap[_selectedTabIndex] ?? false;
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpandedMap[_selectedTabIndex] = !(isExpanded);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Table of Content",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 24,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    firstChild: Container(),
                    secondChild: Column(
                      children: [
                        const SizedBox(height: 10),
                        ...items.map((item) => _buildListItem(item)).toList(),
                      ],
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                  ),
                ],
              ),
            ),
          ),
          if (_selectedTabIndex == 0) _buildSchoolInfoContent(),
          if (_selectedTabIndex == 2) _buildFeesContent(),
          if (_selectedTabIndex == 4) _buildFacultyContent(),
          if (_selectedTabIndex == 5) _buildRankingContent(),
          if (_selectedTabIndex == 3) _buildAdmissionContent(),
          if (_selectedTabIndex == 1) _buildReviewsContent()
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildSchoolInfoContent() {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.schoolName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "This school is known for its excellent academic performance and top-notch facilities. It offers a wide range of extracurricular activities and has a strong emphasis on student development.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeesContent() {
    return Container(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.schoolName} - School Fees",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "The fee structure is designed to cover various components, including tuition fees, hostel fees, mess charges, etc. "
                "Fees may vary depending on the programme and the institute's specifications.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[200]!,
                  ),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Standard",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Total Tuition Fees",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    _buildFeeRow("Secondary School Certificate (Class 10th)",
                        "₹ 7.48 L - 26.36 L"),
                    _buildFeeRow("9th", "₹ 6.4 L - 26.36 L"),
                    _buildFeeRow("8th", "₹ 2.1 L - 20.18 L"),
                    _buildFeeRow("7th", "₹ 1.62 L - 13.2 L"),
                    _buildFeeRow("6th", "₹ 1.4 L - 7.5 L"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFacultyContent() {
    return Container(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.schoolName} - School Faculty",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[200]!,
                  ),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Faculty Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Faculty Qualification",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    _buildFeeRow(" Aakanshi Gupta ",
                        "PhD (Education), 2020 – University of Delhi, Delhi"),
                    _buildFeeRow("Abhishek Singhal ",
                        "M.Ed (Education), 2016 – Banaras Hindu University, Varanasi"),
                    _buildFeeRow(" Ajay Sharma ",
                        "M.A (English), 2012 – Jadavpur University, Kolkata"),
                    _buildFeeRow("Anant Kumar Jayswal",
                        "B.Sc (Physics & Chemistry), 2010 – University of Calcutta, Kolkata"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRankingContent() {
    return Container(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.schoolName} - School Ranking",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[200]!,
                  ),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Ranking Parameter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Rank (Out of 10)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    _buildFeeRow("Academic Performance", "9.2"),
                    _buildFeeRow("Infrastructure & Facilities", "8.7"),
                    _buildFeeRow("Extracurricular Activities", "8.5"),
                    _buildFeeRow("Student-Teacher Ratio", "9.0"),
                    _buildFeeRow("Public Reviews & Reputation", "8.9"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdmissionContent() {
    return Container(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // School Name
              Text(
                widget.schoolName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                "Admissions for 2025 are currently open for various UG, PG, Diploma, and PhD programs. "
                "Candidates can apply online through the official admission portal. The selection process "
                "is based on academic performance and entrance test scores (if applicable).",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[200]!,
                  ),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Admission Criteria",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    _buildFeeRow("Mode of Study", "Full-time/Offline"),
                    _buildFeeRow("Programmes Offered", "50+"),
                    _buildFeeRow("Admission Status 2025", "Ongoing"),
                    _buildFeeRow("How to Apply?",
                        "Visit online admission portal of ${widget.schoolName}"),
                    _buildFeeRow("Level of Programmes Offered",
                        "UG, PG, Diplomas & PhD"),
                    _buildFeeRow("Popular Programmes",
                        "MBA | BTech | BBA | BCA | BCom | MCA"),
                    _buildFeeRow("Download Brochure", "Click here to download"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Steps to Apply for Admission:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildStep("1. Visit the official admission portal."),
              _buildStep("2. Register with your email and mobile number."),
              _buildStep(
                  "3. Fill out the online application form with accurate details."),
              _buildStep(
                  "4. Upload required documents (marksheets, ID proof, etc.)."),
              _buildStep("5. Pay the application fee online."),
              _buildStep("6. Appear for an entrance test (if applicable)."),
              _buildStep(
                  "7. Check the admission status and proceed with fee payment."),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildFeeRow(String standard, String fee) {
    return DataRow(
      cells: [
        DataCell(Text(standard)),
        DataCell(Text(fee)),
      ],
    );
  }

  Widget _buildStep(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        step,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildReviewsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Overall Rating (Out of 5)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "4.6",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      _buildStarRating(4.6, 30),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Based on 323 Verified Reviews",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  _buildRatingBar(">4-5 star", 89),
                  _buildRatingBar(">3-4 star", 10),
                  _buildRatingBar(">2-3 star", 0),
                  _buildRatingBar("1-2 star", 0),
                  const SizedBox(height: 20),
                  Text(
                    "Component Ratings (Out of 5)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildComponentRating("Placements", 4.5),
                  _buildComponentRating("Infrastructure", 4.7),
                  _buildComponentRating("Faculty & Course Curriculum", 4.5),
                  _buildComponentRating("Crowd & Campus Life", 4.8),
                  _buildComponentRating("Value for Money", 4.7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating, double size) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: Colors.orange, size: size);
        } else if (index == fullStars && hasHalfStar) {
          return Icon(Icons.star_half, color: Colors.orange, size: size);
        } else {
          return Icon(Icons.star_border, color: Colors.orange, size: size);
        }
      }),
    );
  }

  Widget _buildRatingBar(String label, int percentage) {
    return Row(
      children: [
        SizedBox(width: 80, child: Text(label, style: TextStyle(fontSize: 14))),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        ),
        SizedBox(width: 8),
        Text("$percentage%", style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildComponentRating(String title, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 200, child: Text(title, style: TextStyle(fontSize: 16))),
          Row(
            children: [
              Text(rating.toString(), style: TextStyle(fontSize: 16)),
              const SizedBox(width: 5),
              _buildStarRating(rating, 18),
            ],
          ),
        ],
      ),
    );
  }
}
