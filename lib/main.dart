import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CountriesCard(),
  ));
}

const List<String> seasons = [
  'Winter',
  'Summer',
  'Autumn',
  'Spring',
];

const Map<String, String> seasonImages = {
  'Winter': 'assets/winter.jpg',
  'Summer': 'assets/summer.jpg',
  'Autumn': 'assets/autumn.jpg',
  'Spring': 'assets/spring.jpg',
};

class CountriesCard extends StatelessWidget {
  const CountriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Seasons",
                style: TextStyle(
                  fontSize: 24,
                fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CountryCard(countryName: "FRANCE"),
                  SizedBox(width: 16),
                  CountryCard(countryName: "CAMBODIA"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryCard extends StatefulWidget {
  final String countryName;
  const CountryCard({super.key, required this.countryName});

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  int index = 0;

  void _changeSeason() {
    setState(() {
      index = (index + 1) % seasons.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = seasons[index];
    final imagePath = seasonImages[currentSeason]!;

    return GestureDetector(
      onTap: _changeSeason,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 10),
            Text(
              currentSeason,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.countryName,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
