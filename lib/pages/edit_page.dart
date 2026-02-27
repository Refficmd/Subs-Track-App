import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/subscription_controller.dart';
import '../models/subscription.dart';

class EditPage extends StatefulWidget {
  final Subscription? existingSub;

  const EditPage({super.key, this.existingSub});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final controller = Get.find<SubscriptionController>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController priceController;

  DateTime? selectedDate;
  BillingCycle selectedCycle = BillingCycle.monthly;
  String selectedCategory = "Entertainment";

  final categories = ["Entertainment", "Education", "Software"];

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.existingSub?.name ?? "");
    priceController =
        TextEditingController(text: widget.existingSub?.price.toString() ?? "");

    selectedDate = widget.existingSub?.startDate;

    selectedCycle = widget.existingSub?.cycle ?? BillingCycle.monthly;

    selectedCategory = widget.existingSub?.category ?? "Entertainment";
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  void saveData() {
    if (_formKey.currentState!.validate() && selectedDate != null) {
      DateTime nextBilling;

      if (selectedCycle == BillingCycle.monthly) {
        nextBilling = DateTime(
          selectedDate!.year,
          selectedDate!.month + 1,
          selectedDate!.day,
        );
      } else {
        nextBilling = DateTime(
          selectedDate!.year + 1,
          selectedDate!.month,
          selectedDate!.day,
        );
      }

      final sub = Subscription(
        id: widget.existingSub?.id ?? Random().nextInt(100000).toString(),
        name: nameController.text,
        price: double.parse(priceController.text),
        startDate: selectedDate!,
        nextBillingDate: nextBilling,
        cycle: selectedCycle,
        category: selectedCategory,
      );

      if (widget.existingSub == null) {
        controller.addSubscription(sub);
      } else {
        controller.updateSubscription(sub.id, sub);
      }

      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingSub == null
            ? "Tambah Subscription"
            : "Edit Subscription"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (v) => v!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Harga"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField(
                value: selectedCycle,
                items: BillingCycle.values
                    .map((cycle) => DropdownMenuItem(
                          value: cycle,
                          child: Text(cycle == BillingCycle.monthly
                              ? "Monthly"
                              : "Yearly"),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => selectedCycle = value!),
                decoration: const InputDecoration(labelText: "Billing Cycle"),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField(
                value: selectedCategory,
                items: categories
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => selectedCategory = value!),
                decoration: const InputDecoration(labelText: "Kategori"),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? "Pilih Tanggal"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: pickDate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B8E23),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Pilih",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveData,
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
