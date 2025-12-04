import 'package:actitime_client/actitime_client.dart';

void main() async {
  final client = ActitimeClient.credentials(
      username: "<your_username>",
      password: "<password>",
      authority: "<host>[:<port>]");

  final me = await client.getMe();
  print("Your ID: ${me.id}");
  print("Your full name: ${me.fullName}");
}
