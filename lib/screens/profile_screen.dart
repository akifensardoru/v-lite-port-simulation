import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.orange,
              child: Text("AD", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            const SizedBox(height: 15),
            const Text("Akif Ensar Doru", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text("Saha Kontrol Operatörü • Doğu Terminali", style: TextStyle(color: Colors.white70, fontSize: 14)),
            const Text("Doğu Terminali Liman İşletmeleri", style: TextStyle(color: Colors.orange, fontSize: 12)),
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(color: const Color(0xFF242424), borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: const [
                        Text("Tamamlanan", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        SizedBox(height: 5),
                        Text("14 Görev", style: TextStyle(color: Colors.greenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(color: const Color(0xFF242424), borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: const [
                        Text("AI Uyumu", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        SizedBox(height: 5),
                        Text("%98 Skor", style: TextStyle(color: Colors.greenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFF1C2230), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Aktif Vardiya: Gündüz (08:00 - 20:00)", style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.8)),
                  Text("Kullanılan Ekipman: Crane-04 (Liman Vinci)", style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.8)),
                  Text("Yetki Alanı: Bölge A & B (Tam Yetki)", style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.8)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text("GÜVENLİ ÇIKIŞ YAP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}