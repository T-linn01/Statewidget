import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

Future<List<String>> fetchItems() async {
  await Future.delayed(const Duration(seconds: 3));
  return ['Phở', 'Bún chả', 'Cơm tấm'];
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String>? items;
  bool loading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    setState(() {
      loading = true;
      error = null;
      items = null;
    });

    try {
      final data = await fetchItems();
      setState(() {
        items = data;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error != null) {
      return Center(child: Text('Lỗi: $error'));
    }
    if (items == null) {
      return const Center(child: Text('Chưa tải dữ liệu'));
    }
    return ListView.builder(
      itemCount: items!.length,
      itemBuilder: (context, index) => ListTile(title: Text(items![index])),
    );
  }
}
