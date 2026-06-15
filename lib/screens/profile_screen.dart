import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Data Profil Utama (Bisa diubah)
  String _name = 'Ahmad Pengguna';
  String _dob = '12 Oktober 1998';
  String _email = 'ahmad@email.com';
  String _phone = '081234567890';

  // Fungsi untuk menampilkan Bottom Sheet Edit Profil
  void _showEditProfileBottomSheet() {
    // Controller untuk menampung teks saat mengetik
    final nameController = TextEditingController(text: _name);
    final dobController = TextEditingController(text: _dob);
    final emailController = TextEditingController(text: _email);
    final phoneController = TextEditingController(text: _phone);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled:
          true, // Membuat bottom sheet bisa naik saat keyboard muncul
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Menyesuaikan tinggi keyboard
            top: 24,
            left: 24,
            right: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Profil Saya',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: dobController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                    prefixIcon: const Icon(Icons.cake_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor HP',
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      // Memperbarui state data utama profil
                      setState(() {
                        _name = nameController.text;
                        _dob = dobController.text;
                        _email = emailController.text;
                        _phone = phoneController.text;
                      });
                      Navigator.pop(context); // Tutup bottom sheet
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profil Anda berhasil diperbarui!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('Simpan Perubahan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  // Fungsi saat tombol pengaturan diklik
  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.settings_rounded, color: Colors.indigo),
            SizedBox(width: 10),
            Text('Pengaturan'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.notifications_none_rounded),
              title: Text('Notifikasi Aplikasi'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14),
            ),
            ListTile(
              leading: Icon(Icons.lock_outline_rounded),
              title: Text('Ubah Password'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14),
            ),
            ListTile(
              leading: Icon(Icons.language_rounded),
              title: Text('Bahasa (Language)'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // --- BAGIAN FOTO & NAMA UTAMA ---
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.indigo, width: 3),
                        ),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundColor: Color(0xFFF1F5F9),
                          child: Icon(Icons.person_rounded,
                              size: 60, color: Colors.indigo),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: GestureDetector(
                          onTap: _showEditProfileBottomSheet,
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.indigo,
                            child: Icon(Icons.edit_rounded,
                                size: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _name,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B)),
                  ),
                  Text(
                    _email,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- KARTU INFORMASI PRIBADI ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Informasi Pribadi',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  _buildProfileFieldTile(
                      Icons.person_outline_rounded, 'Nama Lengkap', _name),
                  const Divider(height: 1, indent: 55),
                  _buildProfileFieldTile(
                      Icons.cake_outlined, 'Tanggal Lahir', _dob),
                  const Divider(height: 1, indent: 55),
                  _buildProfileFieldTile(Icons.email_outlined, 'Email', _email),
                  const Divider(height: 1, indent: 55),
                  _buildProfileFieldTile(
                      Icons.phone_android_outlined, 'Nomor HP', _phone),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- KARTU TINDAKAN & AKSES (PENGATURAN & LOGOUT) ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Aplikasi & Keamanan',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  // --- TOMBOL PENGATURAN ---
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.settings_rounded,
                          color: Colors.blue),
                    ),
                    title: const Text('Pengaturan',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF334155))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        size: 16, color: Colors.grey),
                    onTap: _showSettingsDialog,
                  ),
                  const Divider(height: 1, indent: 55),
                  // --- TOMBOL LOGOUT ---
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          const Icon(Icons.logout_rounded, color: Colors.red),
                    ),
                    title: const Text('Keluar Akun',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.red)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk membuat baris detail data profil secara konsisten
  Widget _buildProfileFieldTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: Colors.indigo),
      ),
      title:
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(
        value,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF334155)),
      ),
    );
  }
}
