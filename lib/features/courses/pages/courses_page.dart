import 'package:ayol_uchun_project/features/courses/meneger/course_bloc.dart';
import 'package:ayol_uchun_project/features/courses/meneger/course_event.dart';
import 'package:ayol_uchun_project/features/courses/meneger/course_state.dart';
import 'package:ayol_uchun_project/features/courses/widgets/top_widget.dart';
import 'package:ayol_uchun_project/features/courses/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(LoadCourseData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopWidget(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "KURSLAR (Barchasi)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocListener<CourseBloc, CourseState>(
                listener: (context, state) {
                  if (state is CourseError) {
                    // Xatolik yuz berganda snack bar ko'rsatish
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state is CourseLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CourseLoaded) {
                      final courses = state.courses;
                      if (courses.isEmpty) {
                        return const Center(child: Text("Kurslar topilmadi"));
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: courses.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return CourseCard(course: course);
                        },
                      );
                    } else if (state is CourseError) {
                      return Center(child: Text("Xatolik: ${state.message}"));
                    }
                    // Default holat (CourseInitial)
                    return const Center(child: Text("Kurslar yuklanmoqda..."));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
