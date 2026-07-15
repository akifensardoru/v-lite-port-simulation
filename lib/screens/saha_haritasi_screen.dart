import 'package:flutter/material.dart';

class SahaHaritasiPage extends StatelessWidget {
  const SahaHaritasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bays = [
      {"name": "Bay 01", "color": Colors.redAccent},
      {"name": "Bay 02", "color": Colors.orangeAccent},
      {"name": "Bay 03", "color": Colors.greenAccent},
      {"name": "Bay 04", "color": Colors.greenAccent},
      {"name": "Bay 05", "color": Colors.redAccent},
      {"name": "Bay 06", "color": Colors.orangeAccent},
      {"name": "Bay 07", "color": Colors.orangeAccent},
      {"name": "Bay 08", "color": Colors.greenAccent},
      {"name": "Bay 09", "color": Colors.greenAccent},
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.anchor, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text("V-LITE", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 25),
            const Text("Saha Düzeni", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: bays.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: bays[index]["color"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        bays[index]["name"],
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}