import 'package:flutter/material.dart';
import '../models/event.dart';

class PaymentScreen extends StatefulWidget {
  final Event event;
  const PaymentScreen({Key? key, required this.event}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = 'QRIS';

  void _executePayment() {
    // Memasukkan data transaksi ke dalam riwayat sistem riwayat global
    transactionHistory.add({
      'title': widget.event.title,
      'price': widget.event.price,
      'date': widget.event.date,
      'method': selectedMethod,
      'status': 'Sukses',
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 10),
            Text('Pembayaran Sukses'),
          ],
        ),
        content: const Text(
            'Transaksi Anda berhasil dicatat. Tiket elektrik dapat dilihat pada menu Riwayat.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Tutup Dialog
              Navigator.pop(context); // Keluar dari Payment
              Navigator.pop(context); // Kembali ke Dashboard Utama
            },
            child: const Text('Selesai'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metode Pembayaran'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(widget.event.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  Text(
                    widget.event.price == 0
                        ? 'Gratis'
                        : 'Rp ${widget.event.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Pilih Opsi Pembayaran',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _buildPaymentOption('QRIS (Gopay, OVO, Dana)', 'QRIS',
                Icons.qr_code_scanner_rounded),
            _buildPaymentOption(
                'Transfer Bank BCA', 'BCA', Icons.account_balance_rounded),
            _buildPaymentOption('Transfer Bank Mandiri', 'Mandiri',
                Icons.account_balance_rounded),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: _executePayment,
                child: const Text('Bayar & Konfirmasi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String name, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: RadioListTile(
        secondary: Icon(icon, color: Colors.indigo),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        value: value,
        groupValue: selectedMethod,
        onChanged: (val) {
          setState(() {
            selectedMethod = val.toString();
          });
        },
      ),
    );
  }
}
