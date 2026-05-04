class Pokemon {
  final String name;
  final String type;
  final String image;
  final String desc;
  final String role;
  final String weakness;

  // 🔥 TAMBAHAN
  final String? ability;
  final int? hp;
  final int? attack;
  final int? defense;
  final int? speed;

  Pokemon({
    required this.name,
    required this.type,
    required this.image,
    required this.desc,
    required this.role,
    required this.weakness,
    this.ability,
    this.hp,
    this.attack,
    this.defense,
    this.speed,
  });
}