import 'package:hive/hive.dart';

part 'game_history_model.g.dart';

@HiveType(typeId: 0)
class GameHistoryModel extends HiveObject {
   GameHistoryModel({
    required this.time,
    required this.points,
  });

  @HiveField(0)
  final DateTime time;
  @HiveField(1)
  final int points;

  Map<String, dynamic> toJson() => {
        'time': time.toString(),
        'points': points,
      };

  factory GameHistoryModel.fromJson(Map<String, dynamic> data) => GameHistoryModel(
        time: DateTime.parse(data['time']),
        points: data['points'],
      );
}
