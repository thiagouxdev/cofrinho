import 'package:hive/hive.dart';

part 'piggy_bank_model.g.dart';

@HiveType(typeId: 0)
class PiggyBankModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String goal;

  @HiveField(2)
  final double? initialAmount;

  @HiveField(3)
  final double monthlySaving;

  PiggyBankModel({
    required this.name,
    required this.goal,
    this.initialAmount,
    required this.monthlySaving,
  });
}
