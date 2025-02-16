import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController nicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIC Decoder Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NIC: ${nicController.nicModel.value.nic}'),
              Text('Birth Year: ${nicController.nicModel.value.birthYear}'),
              Text('Date of Birth: ${nicController.nicModel.value.dateOfBirth}'),
              Text('Gender: ${nicController.nicModel.value.gender}'),
              Text('Age: ${nicController.nicModel.value.age}'),
              Text('Weekday: ${nicController.nicModel.value.weekday}'),
              Text('Voting Eligibility: ${nicController.nicModel.value.votingEligibility}'),
            ],
          );
        }),
      ),
    );
  }
}