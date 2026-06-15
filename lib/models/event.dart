class Event {
  final String title;
  final String date;
  final String location;
  final String region;
  final bool isOnline;
  final double price;
  final String imageUrl;

  Event({
    required this.title, // <-- Sudah diperbaiki menjadi koma
    required this.date, // <-- Sudah diperbaiki menjadi koma
    required this.location, // <-- Sudah diperbaiki menjadi koma
    required this.region, // <-- Sudah diperbaiki menjadi koma
    required this.isOnline, // <-- Sudah diperbaiki menjadi koma
    required this.price, // <-- Sudah diperbaiki menjadi koma
    required this.imageUrl, // <-- Sudah diperbaiki menjadi koma
  });
}

// Data Dummy Event yang Jauh Lebih Lengkap & Bervariasi
final List<Event> dummyEvents = [
  // --- KATEGORI TEKNOLOGI & BISNIS (EVENT LAMA) ---
  Event(
    title: 'Seminar Nasional Teknologi & AI 2026',
    date: '15 Agustus 2026',
    location: 'Hotel Mercure',
    region: 'Karawang',
    isOnline: false,
    price: 150000,
    imageUrl:
        'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=500&q=80',
  ),
  Event(
    title: 'Workshop Digital Marketing UMKM',
    date: '20 Agustus 2026',
    location: 'Technomart',
    region: 'Karawang',
    isOnline: false,
    price: 0,
    imageUrl:
        'https://picsum.photos/500/300?random=2', // Tautan alternatif yang dijamin lolos CORS Browser
  ),
  Event(
    title: 'Pelatihan Flutter Pemula ke Mahir',
    date: '05 September 2026',
    location: 'Zoom Meeting',
    region: 'Nasional',
    isOnline: true,
    price: 75000,
    imageUrl:
        'https://images.unsplash.com/photo-1531403009284-440f080d1e12?w=500&q=80',
  ),
  Event(
    title: 'Indonesia Tech Expo 2026',
    date: '10 Oktober 2026',
    location: 'JCC Senayan',
    region: 'Jakarta',
    isOnline: false,
    price: 250000,
    imageUrl:
        'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=500&q=80',
  ),

  // --- KATEGORI OLAHRAGA (SPORTS) ---
  Event(
    title: 'Karawang Fun Run & Half Marathon 2026',
    date: '25 Oktober 2026',
    location: 'Stadion Singaperbangsa',
    region: 'Karawang',
    isOnline: false,
    price: 60000,
    imageUrl:
        'https://images.unsplash.com/photo-1502224562085-639556652f33?w=500&q=80',
  ),
  Event(
    title: 'Turnamen Futsal Antar Instansi Jabar',
    date: '12 November 2026',
    location: 'Resinda Sports Club',
    region: 'Karawang',
    isOnline: false,
    price: 100000,
    imageUrl:
        'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=500&q=80',
  ),

  // --- KATEGORI ESPORTS & GAME (TURNAMEN PS / PC) ---
  Event(
    title: 'Turnamen PS5 EA Sports FC 2026 (FIFA)',
    date: '05 Desember 2026',
    location: 'Rental Camp Ground & Cafe',
    region: 'Karawang',
    isOnline: false,
    price: 35000,
    imageUrl:
        'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=500&q=80',
  ),
  Event(
    title: 'Kejuaraan Mobile Legends Nasional Championship',
    date: '18 Desember 2026',
    location: 'Discord Server / Online',
    region: 'Nasional',
    isOnline: true,
    price: 100000,
    imageUrl:
        'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=500&q=80',
  ),

  // --- KATEGORI HIBURAN & TUR MUSIK (ENTERTAINMENT) ---
  Event(
    title: 'Karawang Indie Music Festival 2026',
    date: '31 Desember 2026',
    location: 'Lapangan Galuh Mas',
    region: 'Karawang',
    isOnline: false,
    price: 125000,
    imageUrl:
        'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=500&q=80',
  ),
];

// Penyimpanan global sederhana untuk Riwayat Transaksi
List<Map<String, dynamic>> transactionHistory = [];
