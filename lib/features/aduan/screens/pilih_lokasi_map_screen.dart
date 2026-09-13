import 'dart:convert';

import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'dart:ui' as ui;

class PilihLokasiMapScreen extends StatefulWidget {
  const PilihLokasiMapScreen({super.key});

  @override
  State<PilihLokasiMapScreen> createState() => _PilihLokasiMapScreenState();
}

class _PilihLokasiMapScreenState extends State<PilihLokasiMapScreen> {
  final MapController mapController = MapController();

  LatLng selectedLocation = const LatLng(-6.194573, 106.891412);

  String alamat = 'Pilih titik lokasi pada peta';

  bool isLoading = false;

  Future<void> getAddress(LatLng position) async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse'
        '?lat=${position.latitude}'
        '&lon=${position.longitude}'
        '&format=json'
        '&addressdetails=1',
      );

      final response = await http.get(
        url,
        headers: {'User-Agent': 'desa_digital/1.0'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final address = data['address'];

        setState(() {
          alamat = [
            address['road'],
            address['village'],
            address['town'],
            address['city'],
            address['county'],
            address['state'],
          ].where((e) => e != null && e.toString().isNotEmpty).join(', ');
        });
      } else {
        setState(() {
          alamat = 'Alamat tidak ditemukan';
        });
      }
    } catch (e) {
      setState(() {
        alamat = 'Gagal mendapatkan alamat';
      });

      debugPrint('Reverse geocoding error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: selectedLocation,
                  initialZoom: 15,

                  onPositionChanged: (position, hasGesture) {
                    if (position.center != null) {
                      selectedLocation = position.center!;
                    }
                  },

                  onMapEvent: (event) {
                    if (event is MapEventMoveEnd) {
                      getAddress(selectedLocation);
                    }
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.hafidtech.desa_digital',
                  ),
                ],
              ),

              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Titik Lokasi",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    // Lancip bawah
                    Positioned(
                      bottom: -8,
                      child: ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          width: 16,
                          height: 10,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Card alamat kamu di sini
            ],
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // CONTAINER BAWAH
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.only(
              right: 0,
              left: 0,
              top: 14,
              bottom: 28,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Lokasi Kejadian/Laporan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(40),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 8),

                            if (isLoading)
                              const Text("Mencari alamat...")
                            else
                              Expanded(
                                child: Text(
                                  alamat,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                Divider(color: Colors.black.withAlpha(20)),
                const SizedBox(height: 8),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.primary,
                        ),
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                              Navigator.pop(context, {
                                'latitude': selectedLocation.latitude,
                                'longitude': selectedLocation.longitude,
                                'alamat': alamat,
                              });
                            },
                      child: Text(
                        'Simpan',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ARROW
          Positioned(
            top: -60,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Transform.rotate(
                    angle: -45 * math.pi / 45,
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.my_location_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Lokasi Saya",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<ui.Path> {
  @override
  ui.Path getClip(Size size) {
    final path = ui.Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<ui.Path> oldClipper) {
    return false;
  }
}
