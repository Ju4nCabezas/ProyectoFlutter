import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:spycatch/services/apiService.dart';
import 'package:spycatch/models/reportes.dart';

class DeviceListView extends StatefulWidget {
  final String endpoint;
  final String title;

  const DeviceListView({
    super.key,
    required this.endpoint,
    required this.title,
  });

  @override
  State<DeviceListView> createState() => _ListViewState();
}

class _ListViewState extends State<DeviceListView> {
  late Future<List<Reportes>> _futureReportes = Future.value([]);
  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureReportes = _fetchReportes();
  }

  Future<List<Reportes>> _fetchReportes() async {
    final data = await apiService.getReportes();
    return data.map<Reportes>((json) => Reportes.fromJson(json)).toList();
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
      body: FutureBuilder<List<Reportes>>(
        future: _futureReportes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(items[index].id_reporte),
                subtitle: Text(items[index].comentario),
                onTap: () {
                  context.goNamed(
                    'detail',
                    pathParameters: {'id': items[index].id_reporte},
                    queryParameters: {'name': items[index].comentario},
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
