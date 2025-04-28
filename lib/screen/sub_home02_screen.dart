import 'package:flutter/material.dart';

class SubHome02Screen extends StatefulWidget {
  const SubHome02Screen({super.key});

  @override
  State<SubHome02Screen> createState() => _SubHome02ScreenState();
}

class _SubHome02ScreenState extends State<SubHome02Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "เงินเข้า/เงินออก",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.arrow_circle_up_outlined,
                      color: Colors.red,
                      size: 36,
                    ),
                    title: Text(
                      'Item $index',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '11/มกราคม/2567',
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: Text(
                      "1233.12",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
