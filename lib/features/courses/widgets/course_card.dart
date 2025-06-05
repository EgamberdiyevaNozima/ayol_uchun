import 'package:ayol_uchun_project/data/model/course_model.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              course.imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Text('${course.rating} ⭐', style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    // Agar avatars soni modelda bo'lmasa, o'chirib yuboring yoki static qiling
                    ...List.generate(
                      course.enrolled > 5 ? 5 : course.enrolled,  // Masalan 5 avatargacha ko'rsatish
                      (index) => Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(course.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(
                  course.description,
                  style: const TextStyle(color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('${course.enrolled} enrolled', style: const TextStyle(fontWeight: FontWeight.bold)),
                    // Old price modelda yo'q bo'lsa, uni o'chirib yuborish mumkin
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {},
                    child: const Text('Kursga o‘tish ➝'),
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

