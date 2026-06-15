import 'package:flutter/material.dart';
import '../models/event.dart';
import 'payment_screen.dart';

class DetailScreen extends StatelessWidget {
  final Event event;
  const DetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Header Besar dengan Tombol Back Kembali
            Stack(
              children: [
                Image.network(event.imageUrl,
                    width: double.infinity, height: 280, fit: BoxFit.cover),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ),
            // Info Detail
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(event.region,
                        style: const TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ),
                  const SizedBox(height: 16),
                  Text(event.title,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B))),
                  const Divider(height: 40),

                  // Detail baris info
                  _buildInfoRow(Icons.calendar_month_rounded, 'Tanggal & Waktu',
                      event.date),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.location_on_rounded, 'Tempat Pelaksanaan',
                      '${event.location} (${event.isOnline ? 'Online' : 'Offline'})'),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                      Icons.payments_rounded,
                      'Biaya Pendaftaran',
                      event.price == 0
                          ? 'Gratis / Free'
                          : 'Rp ${event.price.toStringAsFixed(0)}'),

                  const Divider(height: 40),
                  const Text('Deskripsi Kegiatan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B))),
                  const SizedBox(height: 8),
                  const Text(
                    'Dapatkan wawasan mendalam serta relasi baru melalui kegiatan interaktif ini. Acara ini dirancang khusus untuk meningkatkan keahlian praktis Anda secara terarah.',
                    style: TextStyle(
                        fontSize: 15, color: Colors.grey, height: 1.6),
                  ),
                  const SizedBox(height: 100), // Jarak aman scroll bawah
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -4))
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentScreen(event: event)));
            },
            child: const Text('Ikuti / Daftar Sekarang',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.indigo),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155))),
          ],
        )
      ],
    );
  }
}
