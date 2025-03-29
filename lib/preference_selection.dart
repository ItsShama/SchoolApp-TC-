import 'package:flutter/material.dart';

class CoursePreferencesScreen extends StatefulWidget {
  const CoursePreferencesScreen({super.key});

  @override
  State<CoursePreferencesScreen> createState() => _CoursePreferencesScreenState();
}

class _CoursePreferencesScreenState extends State<CoursePreferencesScreen> {
  final List<String> selectedStreams = [];
  final List<String> selectedCourses = [];
  String? selectedCourseLevel;
  String? selectedMode;

  Widget buildChips(List<String> options, List<String> selectedList, {bool singleSelect = false}) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = selectedList.contains(option);
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) {
            setState(() {
              if (singleSelect) {
                selectedList
                  ..clear()
                  ..add(option);
              } else {
                isSelected ? selectedList.remove(option) : selectedList.add(option);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course Preferences"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros.",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),

              const Text("Interested Streams", style: TextStyle(fontWeight: FontWeight.bold)),
              buildChips([
                'Engineering', 'Management', 'Arts', 'Science', 'Law',
                'Medicine', 'Design', 'Humanities'
              ], selectedStreams),
              const SizedBox(height: 24),

              const Text("Course(s) Interested In", style: TextStyle(fontWeight: FontWeight.bold)),
              buildChips([
                'BBA / MBA (General)', 'MBA (Finance)', 'MBA (Marketing)',
                'MBA (HR)', 'MBA (Operations)', 'PGDM',
                'Entrepreneurship & Startups', 'Business Analytics'
              ], selectedCourses),
              const SizedBox(height: 24),

              const Text("Preferred Course Level", style: TextStyle(fontWeight: FontWeight.bold)),
              buildChips(['UG', 'PG', 'Diploma/Certification'], [selectedCourseLevel ?? ''], singleSelect: true),
              const SizedBox(height: 24),

              const Text("Mode of Study", style: TextStyle(fontWeight: FontWeight.bold)),
              buildChips(['Full-time', 'Part-time', 'Online', 'Distance learning'], [selectedMode ?? ''], singleSelect: true),
            ],
          ),
        ),
      ),
    );
  }
}
