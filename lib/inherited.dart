import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 1. InheritedWidget để chia sẻ username
class UserProvider extends InheritedWidget {
  final String username;

  const UserProvider({
    Key? key,
    required this.username,
    required Widget child,
  }) : super(key: key, child: child);

  // Dễ dàng truy cập từ widget con
  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  // Cập nhật nếu username thay đổi
  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return username != oldWidget.username;
  }
}

// 2. MyApp là widget gốc, cung cấp username
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      username: 'Vu Thuy Linh',
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.orange,
              leading: IconButton(
                  icon: Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    print('Leading icon clicked!');
                  },
              ),
              title: Text('Time to Shopping')),
          body: Center(
            child: UserDisplay(),
          ),
        ),
      ),
    );
  }
}

// 3. Widget con: hiển thị username
class UserDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider.of(context);

    return Text(
      'Xin chào: ${userProvider?.username ?? "không rõ"}',
      style: TextStyle(fontSize: 24),
    );
  }
}
