
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
  int _selectedIndex = 0;

  final List<String> _titles = [
    "Trang Chủ",
    "BT1: My Place",
    "BT2: My Class Room",
    "BT3: My Guide",
    "BT4: Booking",
    "BT5: Change Color",
    "BT 5.1: Counter App",
    "BT 5.2: Countdown Timer",
    "BT 6: Form Login",
    "BT 6.1: Form Register",
    "BT 7: BMI",
    "BT 7.1: Feedback",
    "BT8: Web API",
    "BT9: News API",
    "BT10: Login & Profile",
  ];

  // Hàm xây dựng nội dung Trang Chủ đẹp mắt
  Widget _buildHomePage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hiển thị logo_it.png với hiệu ứng bo góc và đổ bóng
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
          
                'lib/img/logo_it.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "HỆ THỐNG BÀI TẬP FLUTTER",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Chào Mừng Bạn Đã Đến App Hệ Thống Bài Tập Flutter!",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          

          ),
        
          const SizedBox(height: 20),
           const Text(
            "By: Đặng Long",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          

          ),
          const SizedBox(height: 40),
          // ElevatedButton.icon(
          //   onPressed: () {
          //     // Mở ngăn kéo khi bấm nút
          //     Scaffold.of(context).openDrawer();
          //   },
          //   icon: const Icon(Icons.menu_open),
          //   label: const Text("Bắt đầu khám phá"),
          //   style: ElevatedButton.styleFrom(
          //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _getExerciseWidget() {
    switch (_selectedIndex) {
      case 0: return _buildHomePage();
      case 1: return const MyPlace();
      case 2: return MyClassroom();
      case 3: return const GUI();
      case 4: return MyHotel();
      case 5: return const ChangeColorApp();
      case 6: return CounterApp();
      case 7: return const CountdownTimer();
      case 8: return FormLogin();
      case 9: return FormRegister();
      case 10: return BMI();
      case 11: return Request();
      case 12: return NewsListScreen();
      case 13: return MyProductScreen();
      case 14: return TokenStoragePage();
      default: return _buildHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex], style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 45, color: Colors.blueAccent),
              ),
              
              accountName: const Text("Đặng Long", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              accountEmail: const Text("dangvanlong0702@gmail.com"),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _titles.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Icon(
                      i == 0 ? Icons.home_rounded : Icons.assignment_outlined,
                      color: _selectedIndex == i ? Colors.blueAccent : Colors.grey,
                    ),
                    title: Text(
                      _titles[i],
                      style: TextStyle(
                        fontWeight: _selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                        color: _selectedIndex == i ? Colors.blueAccent : Colors.black87,
                      ),
                    ),
                    selected: _selectedIndex == i,
                    selectedTileColor: Colors.blue.withOpacity(0.1),
                    onTap: () {
                      setState(() => _selectedIndex = i);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _getExerciseWidget(),
      ),
    );
  }
}