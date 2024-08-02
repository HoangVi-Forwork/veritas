import 'package:flutter/material.dart';

class MessageCenterScreen extends StatelessWidget {
  const MessageCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          10,
          (index) => Container(
            width: double.infinity, // Chiều rộng đầy đủ
            height: 100, // Chiều cao cho từng Container
            color: _getContainerColor(
                index), // Màu sắc khác nhau cho từng Container
            child: Center(
              child: Text(
                'Container ${index + 1}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Hàm để lấy màu sắc cho từng Container
  Color _getContainerColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.purple;
      case 5:
        return Colors.teal;
      case 6:
        return const Color.fromARGB(255, 150, 137, 0);
      case 7:
        return const Color.fromARGB(255, 0, 32, 150);
      case 8:
        return Color.fromARGB(255, 206, 22, 130);
      case 9:
        return Color.fromARGB(255, 57, 179, 44);

      default:
        return Colors.black; // Màu mặc định
    }
  }
}
