import 'package:flutter_test/flutter_test.dart';
import 'package:nic_decoder/utils/nic_decoder.dart';
import 'package:nic_decoder/models/nic_model.dart';

void main() {
  group('NIC Decoder Tests', () {
    test('Decode Old NIC Format - Male, Eligible to Vote', () {
      // Arrange
      String nic = "853400937V";

      // Act
      NICModel result = NICDecoder.decodeNIC(nic);

      // Assert
      expect(result.nic, "853400937V");
      expect(result.birthYear, "1985");
      expect(result.dateOfBirth, "5/12/1985");
      expect(result.gender, "Male");
      expect(result.age, (DateTime.now().year - 1985).toString());
      expect(result.weekday, "Thursday");
      expect(result.votingEligibility, "Eligible");
    });

    test('Decode Old NIC Format - Female, Not Eligible to Vote', () {
      // Arrange
      String nic = "856700937X";

      // Act
      NICModel result = NICDecoder.decodeNIC(nic);

      // Assert
      expect(result.nic, "856700937X");
      expect(result.birthYear, "1985");
      expect(result.dateOfBirth, "5/12/1985");
      expect(result.gender, "Female");
      expect(result.age, (DateTime.now().year - 1985).toString());
      expect(result.weekday, "Thursday");
      expect(result.votingEligibility, "Not Eligible");
    });

    test('Decode New NIC Format - Male', () {
      // Arrange
      String nic = "198534000937";

      // Act
      NICModel result = NICDecoder.decodeNIC(nic);

      // Assert
      expect(result.nic, "198534000937");
      expect(result.birthYear, "1985");
      expect(result.dateOfBirth, "5/12/1985");
      expect(result.gender, "Male");
      expect(result.age, (DateTime.now().year - 1985).toString());
      expect(result.weekday, "Thursday");
      expect(result.votingEligibility, null); // New format doesn't have voting info
    });

    test('Decode New NIC Format - Female', () {
      // Arrange
      String nic = "198567000937";

      // Act
      NICModel result = NICDecoder.decodeNIC(nic);

      // Assert
      expect(result.nic, "198567000937");
      expect(result.birthYear, "1985");
      expect(result.dateOfBirth, "5/12/1985");
      expect(result.gender, "Female");
      expect(result.age, (DateTime.now().year - 1985).toString());
      expect(result.weekday, "Thursday");
      expect(result.votingEligibility, null); // New format doesn't have voting info
    });

    test('Invalid NIC Format - Less than 10 characters', () {
      // Arrange
      String nic = "123456789";

      // Act
      NICModel result = NICDecoder.decodeNIC(nic);

      // Assert
      expect(result.nic, "123456789");
      expect(result.birthYear, null);
      expect(result.dateOfBirth, null);
      expect(result.gender, null);
      expect(result.age, null);
      expect(result.weekday, null);
      expect(result.votingEligibility, null);
    });

    test('Invalid NIC Format - More than 12 characters', () {
      // Arrange
      String nic = "1234567890123";

      // Act
      NICModel result = NICDecoder.decodeNIC(nic);

      // Assert
      expect(result.nic, "1234567890123");
      expect(result.birthYear, null);
      expect(result.dateOfBirth, null);
      expect(result.gender, null);
      expect(result.age, null);
      expect(result.weekday, null);
      expect(result.votingEligibility, null);
    });
  });
}