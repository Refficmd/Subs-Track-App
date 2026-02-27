import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/subscription_controller.dart';
import '../models/subscription.dart';
import 'edit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubscriptionController());

    final rupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final tanggalIndo =
        DateFormat('d MMM yyyy', 'id_ID');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Subsense"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {

          controller.checkAndUpdateBilling();

          return Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E8D7),
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text("Monthly Cost"),
                    Text(
                      rupiah.format(
                          controller.monthlyTotal),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text("Yearly Projection"),
                    Text(
                      rupiah.format(
                          controller.yearlyTotal),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount:
                      controller.subscriptions.length,
                  itemBuilder:
                      (context, index) {

                    final sub =
                        controller.subscriptions[index];

                    int daysLeft = sub.nextBillingDate
                        .difference(DateTime.now())
                        .inDays;

                    Color statusColor;

                    if (daysLeft <= 3) {
                      statusColor = Colors.red;
                    } else if (daysLeft <= 7) {
                      statusColor = Colors.orange;
                    } else {
                      statusColor = Colors.grey;
                    }

                    return Card(
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.all(16),
                        title: Text(sub.name),
                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${rupiah.format(sub.price)} • "
                              "${sub.cycle == BillingCycle.monthly ? "Monthly" : "Yearly"}",
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Next: ${tanggalIndo.format(sub.nextBillingDate)}",
                              style: TextStyle(
                                color: statusColor,
                                fontWeight:
                                    FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  Get.to(() =>
                                      EditPage(
                                        existingSub:
                                            sub,
                                      )),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  controller
                                      .deleteSubscription(
                                          sub.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton:
          FloatingActionButton(
        backgroundColor:
            const Color(0xFF6B8E23),
        onPressed: () =>
            Get.to(() => const EditPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}