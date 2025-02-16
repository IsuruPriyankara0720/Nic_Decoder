import '../models/nic_model.dart';

class NICDecoder {
  static NICModel decodeNIC(String nic) {
    NICModel model = NICModel();
    model.nic = nic;

    if (nic.length == 10) {
      // Old NIC format
      model.birthYear = '19${nic.substring(0, 2)}';
      int dayOfYear = int.parse(nic.substring(2, 5));
      model.gender = dayOfYear < 500 ? 'Male' : 'Female';
      model.dateOfBirth = _getDateOfBirth(int.parse(model.birthYear!), dayOfYear);
      model.votingEligibility = nic[9] == 'V' ? 'Eligible' : 'Not Eligible';
    } else if (nic.length == 12) {
      // New NIC format
      model.birthYear = nic.substring(0, 4);
      int dayOfYear = int.parse(nic.substring(4, 7));
      model.gender = dayOfYear < 500 ? 'Male' : 'Female';
      model.dateOfBirth = _getDateOfBirth(int.parse(model.birthYear!), dayOfYear);
    }

    model.age = (DateTime.now().year - int.parse(model.birthYear!)).toString();
    model.weekday = _getWeekday(model.dateOfBirth!);

    return model;
  }

  static String _getDateOfBirth(int year, int dayOfYear) {
    DateTime date = DateTime(year, 1, 1).add(Duration(days: dayOfYear - 1));
    return '${date.day}/${date.month}/${date.year}';
  }

  static String _getWeekday(String date) {
    List<String> parts = date.split('/');
    DateTime dt = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
    return dt.weekday == 7 ? 'Sunday' : dt.weekday == 1 ? 'Monday' : dt.weekday == 2 ? 'Tuesday' : dt.weekday == 3 ? 'Wednesday' : dt.weekday == 4 ? 'Thursday' : dt.weekday == 5 ? 'Friday' : 'Saturday';
  }
}