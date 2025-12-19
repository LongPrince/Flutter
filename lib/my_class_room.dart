import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Classroom", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(icon: const Icon(Icons.add, color: Colors.black54), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.black54), onPressed: () {}),
        ],
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    // Sử dụng ListView để hiển thị danh sách các lớp học
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        classroomItem(
          title: "XML và ứng dụng - Nhóm 1",
          subtitle: "2025-2026.1.TIN4583.001",
          students: "58 học viên",
          color: const Color(0xFF3C4043), // Màu xám đậm
        ),
        classroomItem(
          title: "Lập trình ứng dụng cho các t...",
          subtitle: "2025-2026.1.TIN4403.006",
          students: "55 học viên",
          color: const Color(0xFF5F6368), // Màu xám vừa
        ),
        classroomItem(
          title: "Lập trình ứng dụng cho các t...",
          subtitle: "2025-2026.1.TIN4403.0041",
          students: "50 học viên",
          color: const Color(0xFF1967D2), // Màu xanh dương
        ),
      ],
    );
  }

  // Widget con đại diện cho mỗi item lớp học
  Widget classroomItem({
    required String title,
    required String subtitle,
    required String students,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const Spacer(), // Đẩy phần số lượng học viên xuống dưới cùng
            Text(
              students,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}