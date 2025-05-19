enum VehicleStatus {
  stopped,
  moving,
  paused,
}

class Vehicle {
  final String name; //biến chỉ được gán 1 lần và phải gán trong constructor

  Vehicle(this.name); //this là từ khóa đại diện cho chính đối tượng hiện tại (this object) //constructor rút gọn. gán gia trị vào name

  void status() {
    print('$name: trạng thái không xác định.'); // phương thức mặc định in ra status
  }
}

mixin EngineControl {
  VehicleStatus _status = VehicleStatus.stopped;

  void startEngine() {
    _status = VehicleStatus.moving;
    print('Động cơ khởi động. Đang di chuyển...');
  }

  void pauseEngine() {
    if (_status == VehicleStatus.moving) {
      _status = VehicleStatus.paused;
      print('Xe tạm dừng.');
    } else {
      print('Không thể tạm dừng khi xe đang $_status.');
    }
  }

  void stopEngine() {
    _status = VehicleStatus.stopped;
    print('Đã tắt động cơ.');
  }

  VehicleStatus get currentStatus => _status;
}

class Car extends Vehicle with EngineControl {
  Car(String name) : super(name); //gọi constructor của vehicle để gán giá trị vào name

  @override
  void status() {
    print('$name hiện đang ở trạng thái: $currentStatus');
  }


}
void main() {
  final myCar = Car('Toyota');

  myCar.status();
  myCar.startEngine();
  myCar.status();
  myCar.pauseEngine();
  myCar.stopEngine();
}
