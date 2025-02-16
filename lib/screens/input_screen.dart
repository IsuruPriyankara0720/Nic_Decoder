import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'result_screen.dart';

class InputScreen extends StatelessWidget {
  final NICController nicController = Get.put(NICController());
  final TextEditingController nicInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIC Decoder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nicInputController,
              decoration: InputDecoration(
                labelText: 'Enter NIC Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                nicController.decodeNIC(nicInputController.text);
                Get.to(ResultScreen());
              },
              child: Text('Decode NIC'),
            ),
          ],
        ),
      ),
    );
  }
}