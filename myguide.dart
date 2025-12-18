import 'package:flutter/material.dart';

class MyGuide extends StatelessWidget {
  const MyGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Thanh trên cùng (nền xanh + ô tìm kiếm)
            Container(
              color: const Color(0xFF0057B8), // xanh Booking
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            "Xung quanh vị trí hiện tại",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "23 thg 10  –  24 thg 10",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 🔹 Thanh công cụ
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
                color: Colors.white,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.sort, size: 18, color: Colors.red),
                      SizedBox(width: 5),
                      Text("Sắp xếp", style: TextStyle(fontSize: 13, color: Colors.black87)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.tune, size: 18, color: Colors.black87),
                      SizedBox(width: 5),
                      Text("Lọc", style: TextStyle(fontSize: 13, color: Colors.black87)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.map_outlined, size: 18, color: Colors.black87),
                      SizedBox(width: 5),
                      Text("Bản đồ", style: TextStyle(fontSize: 13, color: Colors.black87)),
                    ],
                  ),
                ],
              ),
            ),

            // 🔹 Danh sách khách sạn
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: const [
                  ResortCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1640346678528-2bb4d99d8c10?auto=format&fit=crop&q=80&w=735',
                    title: "aNhill Boutique",
                    rating: 9.5,
                    review: "Xuất sắc",
                    location: "Huế",
                    distance: "0,6km",
                    roomType: "1 suite riêng tư",
                    bed: "1 giường",
                    price: "US\$109",
                  ),
                  ResortCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=60",
                    title: "An Nam Hue Boutique",
                    rating: 9.2,
                    review: "Tuyệt hảo",
                    location: "Cư Chinh",
                    distance: "0,9km",
                    roomType: "1 phòng khách sạn",
                    bed: "1 giường",
                    price: "US\$20",
                  ),
                  ResortCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600585152220-90363fe7e115?auto=format&fit=crop&w=800&q=60",
                    title: "Huế Jade Hill Villa",
                    rating: 8.0,
                    review: "Rất tốt",
                    location: "Cư Chinh",
                    distance: "1,3km",
                    roomType: "1 biệt thự nguyên căn",
                    bed: "4 giường – 3 phòng ngủ",
                    price: "US\$285",
                    hasBreakfast: false,
                    note:
                        "Chỉ còn 1 căn với giá này trên Booking.com\n❌ Không cần thanh toán trước",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResortCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final String review;
  final String location;
  final String distance;
  final String roomType;
  final String bed;
  final String price;
  final bool hasBreakfast;
  final String? note;

  const ResortCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.review,
    required this.location,
    required this.distance,
    required this.roomType,
    required this.bed,
    required this.price,
    this.hasBreakfast = true,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0.8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                if (hasBreakfast)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A650),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "Bao bữa sáng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),

            // Nội dung
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên + tim
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Icon(Icons.favorite_border, size: 18),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Sao + điểm
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => const Icon(Icons.star,
                            color: Color(0xFFFFB800), size: 14),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF003580),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          rating.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "$review · 95 đánh giá",
                        style:
                            const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 12, color: Colors.grey),
                      const SizedBox(width: 3),
                      Text(
                        "$location · Cách bạn $distance",
                        style:
                            const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "$roomType: $bed",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),

                  const Text(
                    "Đã bao gồm thuế và phí",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),

                  if (note != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      note!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
