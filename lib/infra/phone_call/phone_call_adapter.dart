import 'package:url_launcher/url_launcher.dart';
import 'package:zeitplan/data/infra/phone_call/phone_call.dart';

class PhoneCallAdapter implements PhoneCall{
  @override
  void call(String phone) async{
    await launch("tel:$phone");
  }

}