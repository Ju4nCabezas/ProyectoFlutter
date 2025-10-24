import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:spycatch/models/tips.dart';
import 'package:spycatch/services/apiService.dart';

class TipsList extends StatefulWidget {
  final String endpoint;
  final String title;

  const TipsList({super.key, required this.endpoint, required this.title});

  @override
  State<TipsList> createState() => _ListViewState();
}

class _ListViewState extends State<TipsList> {
  late Future<List<Tips>> _futureTips = Future.value([]);
  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureTips = _fetchTips();
  }

  Future<List<Tips>> _fetchTips() async {
    final data = await apiService.getTips();
    return data.map<Tips>((json) => Tips.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: FutureBuilder<List<Tips>>(
        future: _futureTips,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].description),
            ),
          );
        },
      ),
    );
  }
}
