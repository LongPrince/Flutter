import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(
      children: [
        block1(),
        block2(),
        block3(),
        block4(),
      ],
    );
  }

  // PHẦN 1: HÌNH ẢNH
  Widget block1() {
    return Image.network(
        'https://images.pexels.com/photos/33286548/pexels-photo-33286548.jpeg',
      
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
    );
  }

  // PHẦN 2: TIÊU ĐỀ + ĐỊA CHỈ
  Widget block2() {
    const namePlace = "Oeschinen Lake Campground";
    const addressPlace = "Kandersteg, Switzerland";
    const votePlace = "41";

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  namePlace,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  addressPlace,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const Text(votePlace),
        ],
      ),
    );
  }

  // PHẦN 3: NÚT CHỨC NĂNG
  Widget block3() {
    const color = Colors.blue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }

  // PHẦN 4: MÔ TẢ
  Widget block4() {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
        'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
        'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
        'and pine forest, leads you to the lake.',
        softWrap: true,
      ),
    );
  }
}
