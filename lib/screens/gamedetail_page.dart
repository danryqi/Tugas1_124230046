import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login/models/game_store.dart';

class GameDetailPage extends StatelessWidget {
  final GameStore game; 

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(game.imageUrls[0]),
            const SizedBox(height: 12),
            Text(game.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Review: ${game.reviewAverage}"),
            const SizedBox(height: 8),
            Text("Tags: ${game.tags}"),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse(game.linkStore));
              },
              child: Text("Buka di Steam"),
            )
          ],
        ),
      ),
    );
  }
}
