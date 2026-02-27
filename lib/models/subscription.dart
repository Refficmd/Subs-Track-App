enum BillingCycle { monthly, yearly }

class Subscription {
  String id;
  String name;
  double price;
  DateTime startDate;
  DateTime nextBillingDate;
  BillingCycle cycle;
  String category;
  bool isActive;

  Subscription({
    required this.id,
    required this.name,
    required this.price,
    required this.startDate,
    required this.nextBillingDate,
    required this.cycle,
    required this.category,
    this.isActive = true,
  });

  double get monthlyCost => cycle == BillingCycle.monthly ? price : price / 12;

  double get yearlyCost => cycle == BillingCycle.yearly ? price : price * 12;
}
