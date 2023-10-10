import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapListPage(),
    );
  }
}

class MapData {
  final String name;
  final String imageUrl;

  MapData(this.name, this.imageUrl);

  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      json['displayName'] ?? '',
      json['splash'] ?? '', // Assurez-vous que l'API fournit l'URL de l'image.
    );
  }
}

class MapListPage extends StatefulWidget {
  @override
  _MapListPageState createState() => _MapListPageState();
}

class _MapListPageState extends State<MapListPage> {
  List<MapData> mapDataList = [];

  @override
  void initState() {
    super.initState();
    fetchMapData();
  }

  Future<void> fetchMapData() async {
    final response = await http.get(
      Uri.parse('https://valorant-api.com/v1/maps'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mapsData = data['data'] as List<dynamic>;

      setState(() {
        mapDataList =
            mapsData.map((mapData) => MapData.fromJson(mapData)).toList();
      });
    } else {
      throw Exception('Échec de la requête à l\'API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noms des Maps Valorant'),
      ),
      body: mapDataList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: mapDataList.map((mapData) {
                return ListTile(
                  leading: Image.network(
                      mapData.imageUrl), // Affiche l'image à gauche du nom.
                  title: Text(mapData.name),
                );
              }).toList(),
            ),
    );
  }
}
