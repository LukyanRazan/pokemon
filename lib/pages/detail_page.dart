import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../utils/type_color.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = getTypeColor(pokemon.type);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage(pokemon.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  color.withOpacity(0.7),
                  BlendMode.srcOver,
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          pokemon.type,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("About"),
                  _infoCard([
                    _infoItem(Icons.group, "Role", pokemon.role),
                    _divider(),
                    _infoItem(Icons.flash_on, "Weakness", pokemon.weakness),
                    _divider(),
                    _infoItem(Icons.star, "Ability", pokemon.ability ?? "-"),
                  ]),
                  const SizedBox(height: 20),
                  _sectionTitle("Stats"),
                  _infoCard([
                    statBar("HP", pokemon.hp ?? 50, color),
                    statBar("Attack", pokemon.attack ?? 50, color),
                    statBar("Defense", pokemon.defense ?? 50, color),
                    statBar("Speed", pokemon.speed ?? 50, color),
                  ]),
                  const SizedBox(height: 20),
                  _sectionTitle("Description"),
                  const SizedBox(height: 8),
                  Text(
                    pokemon.desc,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Widget _infoCard(List<Widget> children) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(children: children),
      );

  Widget _infoItem(IconData icon, String title, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon, color: Colors.greenAccent, size: 18),
              const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
            ]),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _divider() => Divider(
        color: Colors.white.withOpacity(0.08),
        thickness: 1,
      );

  Widget statBar(String title, int value, Color color) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                Text("$value/150",
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: value / 150,
              backgroundColor: Colors.white12,
              color: color,
              minHeight: 8,
            ),
          ],
        ),
      );
}
