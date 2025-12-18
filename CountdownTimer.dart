import 'dart:async'; // Cần thiết để sử dụng Timer
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  // 1. Dùng TextEditingController cho ô nhập dữ liệu
  final TextEditingController _controller = TextEditingController();
  
  Timer? _timer; // Biến quản lý Timer
  int _secondsRemaining = 0; // Số giây còn lại
  bool _isRunning = false; // Trạng thái đang chạy

  // 2. Hàm bắt đầu đếm ngược
  void _startTimer() {
    // Lấy giá trị từ ô nhập liệu và chuyển sang số nguyên
    int inputSeconds = int.tryParse(_controller.text) ?? 0;

    if (inputSeconds <= 0) return;

    // Hủy timer cũ nếu có trước khi bắt đầu cái mới
    _timer?.cancel();

    setState(() {
      _secondsRemaining = inputSeconds;
      _isRunning = true;
    });

    // 3. Dùng Timer.periodic() từ dart:async
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          _isRunning = false;
          // 4. Khi hết giờ, hiển thị thông báo
          _showTimeoutDialog();
        }
      });
    });
  }

  // Hàm hiển thị thông báo khi hết giờ
  void _showTimeoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thông báo"),
        content: const Text("⏰ Hết thời gian!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Hàm đặt lại (Reset)
  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 0;
      _isRunning = false;
      _controller.clear();
    });
  }

  // 5. Hủy Timer trong dispose() để tránh rò rỉ bộ nhớ
  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // Hàm hỗ trợ định dạng giây thành dạng MM:SS
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⌛ Bộ đếm thời gian"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nhập số giây cần đếm:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Ví dụ: 10",
                border: OutlineInputBorder(),
              ),
              enabled: !_isRunning, // Khóa ô nhập khi đang đếm
            ),
            const SizedBox(height: 40),
            // Hiển thị thời gian đếm ngược
            Text(
              _formatTime(_secondsRemaining),
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning ? null : _startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Bắt đầu"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[100]),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}