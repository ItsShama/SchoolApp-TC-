import 'package:flutter/material.dart';

class CompareSchools extends StatefulWidget {
  final String selectedBoard;
  final List<String> schoolList;
  final Function(String) onSchoolSelected;

  CompareSchools({
    super.key,
    required this.selectedBoard,
    required this.schoolList,
    required this.onSchoolSelected,
  });

  @override
  _CompareSchoolsState createState() => _CompareSchoolsState();
}

class _CompareSchoolsState extends State<CompareSchools> {
  List<String> filteredSchools = [];
  String? selectedSchool;

  @override
  void initState() {
    super.initState();
    _filterSchools();
  }

  void _filterSchools() {
    setState(() {
      filteredSchools = widget.schoolList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Select School for Comparison",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 10),
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search ${widget.selectedBoard} School",
                    prefixIcon: Icon(Icons.search, color: Colors.purple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (query) {
                    setState(() {
                      filteredSchools = widget.schoolList
                          .where((school) => school
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                SizedBox(height: 15),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Compare with these suggested schools",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  height: 250,
                  child: ListView.builder(
                    itemCount: filteredSchools.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(filteredSchools[index]),
                          trailing: Icon(Icons.school, color: Colors.purple),
                          onTap: () {
                            setState(() {
                              selectedSchool = filteredSchools[index];
                            });
                          },
                          tileColor: selectedSchool == filteredSchools[index]
                              ? Colors.purple.withOpacity(0.2)
                              : null,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 15),

                // Apply Button
                ElevatedButton(
                  onPressed: selectedSchool == null
                      ? null
                      : () {
                    widget.onSchoolSelected(selectedSchool!);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  ),
                  child: Text(
                    "Apply",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}