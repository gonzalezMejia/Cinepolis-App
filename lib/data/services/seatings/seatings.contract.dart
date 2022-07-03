import 'package:cinepolis/data/models/entities/seatings/seating.model.dart';

abstract class ISeatingService {
  Future<List<SeatingModel>> getSeatingBySchedule(int scheduleId);
}
