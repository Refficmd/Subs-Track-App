import 'package:get/get.dart';
import '../models/subscription.dart';

class SubscriptionController extends GetxController {
  var subscriptions = <Subscription>[].obs;

  void addSubscription(Subscription sub) {
    subscriptions.add(sub);
  }

  void updateSubscription(String id, Subscription updated) {
    int index = subscriptions.indexWhere((s) => s.id == id);
    if (index != -1) {
      subscriptions[index] = updated;
      subscriptions.refresh();
    }
  }

void checkAndUpdateBilling() {
  for (var sub in subscriptions) {
    if (!sub.isActive) continue;

    while (sub.nextBillingDate.isBefore(DateTime.now())) {
      if (sub.cycle == BillingCycle.monthly) {
        sub.nextBillingDate = DateTime(
          sub.nextBillingDate.year,
          sub.nextBillingDate.month + 1,
          sub.nextBillingDate.day,
        );
      } else {
        sub.nextBillingDate = DateTime(
          sub.nextBillingDate.year + 1,
          sub.nextBillingDate.month,
          sub.nextBillingDate.day,
        );
      }
    }
  }
  subscriptions.refresh();
}

  void deleteSubscription(String id) {
    subscriptions.removeWhere((s) => s.id == id);
  }

  double get monthlyTotal => subscriptions
      .where((s) => s.isActive)
      .fold(0, (sum, s) => sum + s.monthlyCost);

  double get yearlyTotal => subscriptions
      .where((s) => s.isActive)
      .fold(0, (sum, s) => sum + s.yearlyCost);

  List<Subscription> get upcoming => subscriptions
      .where((s) =>
          s.isActive &&
          s.nextBillingDate.difference(DateTime.now()).inDays <= 7)
      .toList();
}
