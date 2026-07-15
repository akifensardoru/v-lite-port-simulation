import 'package:flutter/material.dart';
import 'main_screen.dart'; // Giriş yapınca ana sekmelere geçmek için

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              
              // 1. Logo ve Başlık Kısmı
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.anchor, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("V-LITE", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange)),
                      Text("Port Management System", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 60),
              
              // 2. E-Posta / Kullanıcı Adı Girdisi
              TextField(
                decoration: InputDecoration(
                  hintText: "E-posta veya Kullanıcı Adı",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF242424),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
              ),
              
              const SizedBox(height: 15),
              
              // 3. Şifre Girdisi
              TextField(
                obscureText: true, // Şifreyi yıldızlı gösterir
                decoration: InputDecoration(
                  hintText: "Şifre",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF242424),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // 4. Giriş Butonu
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  // Giriş butonuna basılınca sayfayı MainScreen'e (Sekmeli yapıya) yönlendiriyoruz
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                child: const Text("GİRİŞ YAP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
              
              const SizedBox(height: 20),
              
              // 5. Şifremi Unuttum
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Şifremi Unuttum", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
              ),
              
              const Spacer(flex: 3),
              
              // 6. Alt Bilgi (Footer)
              const Center(
                child: Text(
                  "Bu sistem sadece yetkilendirilmiş personel ve liman saha\noperatörlerinin kullanımı içindir.\n\nv1.0.0-beta",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white38, fontSize: 11, height: 1.5),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}