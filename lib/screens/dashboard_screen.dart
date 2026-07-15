import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? activeTask;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/gorevler'));
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          if (data['aktif_gorevler'].isNotEmpty) {
            activeTask = data['aktif_gorevler'][0];
          }
          isLoading = false;
        });
      }
    } catch (e) {
      print("API Bağlantı Hatası: $e");
      setState(() { isLoading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
            const Text("Akif Ensar Doru", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Saha: Doğu Terminali", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                hintText: "Konteyner Ara veya Konuş...",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF242424),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.mic, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF1C2230),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueGrey.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.auto_awesome, color: Colors.orange, size: 18),
                      SizedBox(width: 8),
                      Text("V-Lite AI Önerisi", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Bugün rüzgar hızı yüksek. C bloktaki 4. kat konteynerleri taşırken dikkatli olun.", style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
                ],
              ),
            ),
            const SizedBox(height: 35),
            const Text("Aktif Görev", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            isLoading 
              ? const Center(child: CircularProgressIndicator(color: Colors.orange))
              : activeTask == null 
                ? const Text("Şu an bekleyen görev bulunmuyor.", style: TextStyle(color: Colors.grey))
                : _buildTaskCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF242424), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(activeTask!['konteyner'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(activeTask!['tip'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Mevcut Konum", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 5),
                  Text(activeTask!['baslangic'], style: const TextStyle(fontSize: 20, color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                ],
              ),
              const Icon(Icons.arrow_forward_rounded, color: Colors.grey, size: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Hedef Konum", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 5),
                  Text(activeTask!['hedef'], style: const TextStyle(fontSize: 20, color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: const Text("GÖREVİ BAŞLAT", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}