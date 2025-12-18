
import 'package:app/CountdownTimer.dart';
import 'package:app/CounterApp.dart';
import 'package:app/GUI.dart';
import 'package:app/TokenStoragePage.dart';
import 'package:app/bmi.dart';
import 'package:app/formlogin.dart';
import 'package:app/formregister.dart';
import 'package:app/booking.dart';
import 'package:app/my_product.dart';
import 'package:app/change_color_app.dart';
import 'package:app/my_class_room.dart';
import 'package:app/my_place.dart';
// import 'package:app/myguide.dart';
import 'package:app/request.dart';
import 'package:app/screens/news_list_screen.dart';
import 'package:flutter/material.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       //debugShowCheckedModeBanner: false,
//       home:CountdownTimer(),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// Import các bài tập bạn đã làm vào đây
// ví dụ: import 'bt1_counter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài Tập Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0; // Biến theo dõi bài tập đang chọn

  // Danh sách các tiêu đề bài tập
  List<String> get _titles => [
    "Trang Chủ",
    "BT1: My Place ",
    "BT2: My class room",
    "BT3: My guide",
    "BT4: Booking",
    "BT5: Change color app",
    "BT 5.1: Countter app",
    "BT 5.2: Countdown Timer",
    "BT 6: Form login ",
    "BT 6.1: Form register ", 
    "BT 7: BMI",
    "BT 7.1: Feedback",
    "BT8: WebAPI",
    "BT9: NewsAPI",
    "BT10: Login and Profile ",
    "BT10: Login and Profile ",
  ];

  // Hàm trả về Widget tương ứng với bài tập được chọn
  Widget _getExerciseWidget() {
    switch (_selectedIndex) {
      case 1:
        return const MyPlace(); // Trả về widget CounterApp()
      case 2:
        return  MyClassroom(); // Trả về widget CountdownTimer()
      case 3:
        return const GUI(); // Trả về widget MyPlace()
      case 4:
        return MyHotel(); // Thay bằng Class MyHotel()
       case 5:
        return const ChangeColorApp(); // Thay bằng Class GUI()
      case 6:
        return  CounterApp ();
       case 7:
        return const CountdownTimer();
        case 8:
          return  FormLogin ();
        case 9:
          return  FormRegister ();
        case 10:
          return  BMI ();
        case 11:
          return  Request ();
        case 12:
          return  NewsListScreen ();
        case 13:
          return  MyProductScreen ();
        case 14:
          return  TokenStoragePage ();
     
      default:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
              Text("Chào mừng đến với ứng dụng Bài Tập Flutter", style: TextStyle(fontSize: 18)),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blueAccent,
      ),
      // Thanh menu bên trái (Drawer)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundColor: Colors.white, radius: 30, child: Icon(Icons.person)),
                  SizedBox(height: 20),
                  Text("Danh Sách Bài Tập", style: TextStyle(color: Colors.white, fontSize: 20)),
                   Text("By: Đặng Long", style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
            // Tạo tự động 10 ListTile cho 10 bài tập
            for (int i = 0; i <= 14; i++)
              ListTile(
                leading: Icon(i == 0 ? Icons.home : Icons.book),
                title: Text(_titles[i]),
                selected: _selectedIndex == i,
                onTap: () {
                  setState(() {
                    _selectedIndex = i;
                  });
                  Navigator.pop(context); // Đóng drawer sau khi chọn
                },
              ),
          ],
        ),
      ),
      body: _getExerciseWidget(), // Hiển thị bài tập dựa trên index
    );
  }
}