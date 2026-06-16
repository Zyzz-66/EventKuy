import 'package:flutter/material.dart';
import '../models/event.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRegion = 'Semua Daerah';
  bool isOnlineFilter = false;

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Filter Pencarian',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B))),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedRegion,
                    decoration: InputDecoration(
                      labelText: 'Pilih Wilayah',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    items: ['Semua Daerah', 'Karawang', 'Jakarta', 'Nasional']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) =>
                        setModalState(() => selectedRegion = val!),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    title: const Text('Hanya Event Online',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: const Text('Menampilkan webinar / kelas online'),
                    value: isOnlineFilter,
                    activeColor: Colors.indigo,
                    onChanged: (val) =>
                        setModalState(() => isOnlineFilter = val),
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
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text('Terapkan Filter',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Event> filteredEvents = dummyEvents.where((e) {
      bool matchRegion =
          selectedRegion == 'Semua Daerah' || e.region == selectedRegion;
      bool matchType = !isOnlineFilter || e.isOnline;
      return matchRegion && matchType;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Halo, Selamat Datang 👋',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text('Temukan Event Seru',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B))),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12)),
            child: IconButton(
                icon: const Icon(Icons.tune_rounded, color: Colors.indigo),
                onPressed: _showFilterDialog),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
      ),
      body: filteredEvents.isEmpty
          ? const Center(child: Text('Tidak ada event yang sesuai filter.'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(event: event)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar Event
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(18)),
                              child: Image.network(event.imageUrl,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: event.isOnline
                                      ? Colors.teal
                                      : Colors.orange,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  event.isOnline ? 'ONLINE' : 'OFFLINE',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        // Konten Teks
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xFF1E293B)),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today_rounded,
                                      size: 12, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Expanded(
                                      child: Text(event.date,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 11),
                                          overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_rounded,
                                      size: 12, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Expanded(
                                      child: Text(
                                          '${event.location} (${event.region})',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 11),
                                          overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                event.price == 0
                                    ? 'Gratis'
                                    : 'Rp ${event.price.toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: event.price == 0
                                      ? Colors.green
                                      : Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
