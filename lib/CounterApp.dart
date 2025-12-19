import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // 1. Khai báo biến trạng thái
  int _counter = 0;

  // 2. Hàm xử lý logic tăng số
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  // 3. Hàm xử lý logic giảm số (Yêu cầu bài tập)
  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  // 4. Hàm xử lý reset (Yêu cầu bài tập)
  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  // 5. Hàm xác định màu chữ dựa trên giá trị (Yêu cầu bài tập)
  Color _getTextColor() {
    if (_counter > 0) return Colors.green; // Số dương: Xanh
    if (_counter < 0) return Colors.red;   // Số âm: Đỏ
    return Colors.black;                   // Bằng 0: Đen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đếm Số"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Giá trị hiện tại:",
              style: TextStyle(fontSize: 20),
            ),
            // Hiển thị số với màu thay đổi động
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: _getTextColor(), // Gọi hàm lấy màu
              ),
            ),
            const SizedBox(height: 40),
            // Hàng chứa các nút điều khiển
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nút Giảm
                ElevatedButton(
                  onPressed: _decrement,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  child: const Text("- Giảm", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                // Nút Đặt lại
                ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text("Đặt lại", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                // Nút Tăng
                ElevatedButton(
                  onPressed: _increment,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("+ Tăng", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}