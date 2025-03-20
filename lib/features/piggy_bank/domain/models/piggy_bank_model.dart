import 'package:hive/hive.dart';

part 'piggy_bank_model.g.dart';

@HiveType(typeId: 0)
class PiggyBankModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String goal;

  @HiveField(3)
  double goalAmount;

  @HiveField(4)
  double initialAmount;

  @HiveField(5)
  double monthlyContribution;

  @HiveField(6)
  DateTime creationDate;

  @HiveField(7)
  double currentAmount;

  PiggyBankModel({
    required this.id,
    required this.name,
    required this.goal,
    required this.goalAmount,
    this.initialAmount = 0.0,
    required this.monthlyContribution,
    required this.creationDate,
    required this.currentAmount,
  });

  // Calculates the progress as a percentage
  double get progress => (currentAmount / goalAmount) * 100;

  // Calculates how many months are left to reach the goal
  int get remainingMonths {
    if (currentAmount >= goalAmount) return 0;

    double remainingAmount = goalAmount - currentAmount;
    return (remainingAmount / monthlyContribution).ceil();
  }

  // Calculates the estimated completion date
  DateTime get estimatedCompletionDate {
    return DateTime(
      creationDate.year,
      creationDate.month + remainingMonths,
      creationDate.day,
    );
  }
}
