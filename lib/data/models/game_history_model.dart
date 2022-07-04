class GameHistoryModel {
  const GameHistoryModel({
    required this.time,
    required this.points,
  });

  final DateTime time;
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
