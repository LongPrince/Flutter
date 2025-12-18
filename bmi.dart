import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController weightCtrl = TextEditingController();

  double? bmi;
  String result = "";

  void calculateBMI() {
    double? h = double.tryParse(heightCtrl.text);
    double? w = double.tryParse(weightCtrl.text);

    if (h == null || w == null || h <= 0 || w <= 0) {
      setState(() {
        result = "Vui lòng nhập dữ liệu hợp lệ!";
      });
      return;
    }

    // Nếu user nhập cm → tự chuyển sang mét
    if (h > 10) h = h / 100;

    double bmiValue = w / (h * h);

    String classify = "";
    if (bmiValue < 18.5) {
      classify = "Thiếu cân";
    } else if (bmiValue < 25) {
      classify = "Bình thường";
    } else if (bmiValue < 30) {
      classify = "Thừa cân";
    } else {
      classify = "Béo phì";
    }

    setState(() {
      bmi = bmiValue;
      result = "Chỉ số BMI: ${bmiValue.toStringAsFixed(2)}\nPhân loại: $classify";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tính BMI",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: heightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Chiều cao (m hoặc cm)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: weightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cân nặng (kg)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:40),

            ElevatedButton(
              
              onPressed: calculateBMI,
              child: const Text("Tính BMI",style: TextStyle(fontWeight: FontWeight.bold),),
              

            ),
            
            

            const SizedBox(height: 20),

            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
