import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login/models/game_store.dart';

class GameDetailPage extends StatelessWidget {
  final GameStore game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0F2027)
            ),
          ),
          title: Text(
            game.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData( // 🔹 ini kuncinya
            color: Colors.white,   
          ), 
        ),


      body: Container(
        width: double.infinity,
        height: double.infinity, // 🔹 Biar background full
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)], // biru tua sama kayak homepage
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    game.imageUrls[0],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  game.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                ),
                const SizedBox(height: 16),
                Text(
                  game.price,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                ),
                const SizedBox(height: 14),
                Text(
                  "Release: ${game.releaseDate}",
                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      "${game.reviewAverage} • ${game.reviewCount} reviews",
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: -6,
                  children: game.tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: Colors.black54,
                      labelStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      side: const BorderSide(color: Colors.white24),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 22),
                const Text(
                  "About",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  game.about,
                  style: const TextStyle(color: Colors.white70, height: 1.4),
                ),
                const SizedBox(height: 22),
                if (game.imageUrls.length > 1) ...[
                  const Text(
                    "Screenshots",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: game.imageUrls.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            game.imageUrls[index],
                            fit: BoxFit.cover,
                            width: 240,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.white24),
                      ),
                    ),
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(game.linkStore))) {
                        await launchUrl(Uri.parse(game.linkStore));
                      }
                    },
                    child: const Text(
                      "Buka di Steam",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
