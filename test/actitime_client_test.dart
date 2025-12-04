import 'package:actitime_client/actitime_client.dart';
import 'package:test/test.dart';
import './test_credentials.dart' as credentials;

void main() {
  final client = ActitimeClient.credentials(
      username: credentials.username,
      password: credentials.password,
      authority: credentials.authority);

  group("Test customers", () {
    test("Get customers", () async {
      final customers = await client.getCustomers({"limit": "3"});
      expect(customers.items.length, 3);
    });

    test("Get customer by id", () async {
      final customer = await client.getCustomerById(7);
      expect(customer.id, 7);

      expect(() async {
        await client.getCustomerById(1);
      }, throwsA(isA<ApiError>()));
    });
  });

  group("Test projects", () {
    test("Get projects", () async {
      final projects = await client.getProjects({"offset": "10", "limit": "4"});
      expect(projects.items.length, 4);
    });

    test("Get project by id", () async {
      final project = await client.getProjectById(4);
      expect(project.id, 4);
    });
  });

  group("Test tasks", () {
    test("Get tasks", () async {
      final tasks = await client.getTasks({"limit": "5"});
      expect(tasks.items.length, 5);
    });

    test("Get task by id", () async {
      final taskId = 65;
      final task = await client.getTaskById(taskId);
      expect(task.id, taskId);
    });
  });

  group('Test users', () {
    test('Get users', () async {
      final users = await client.getUsers({"limit": "3", "active": "true"});
      expect(users.items.length, 3);
    });

    test("Get current user", () async {
      final me = await client.getMe();
      expect(me.lastName, "Silvestri");
    });

    test("Get user by id", () async {
      final user = await client.getUserById(28);
      expect(user.id, 28);
    });

    test("Get user schedule", () async {
      final userId = 28;
      final fourDaysAgo = DateTime.now().subtract(Duration(days: 4));
      final dateFrom =
          DateTime(fourDaysAgo.year, fourDaysAgo.month, fourDaysAgo.day);
      final schedule = await client.getUserSchedule(userId, dateFrom);
      expect(schedule.dateFrom, dateFrom);
    });
  });

  group("Test time track", () {
    test("Get time track", () async {
      final startDate = DateTime(2024, 7, 1);
      final timetrack = await client.getTimeTrack(startDate, {"userIds": "28"});
      expect(timetrack.dateFrom, startDate);
    });

    test("Get time track records", () async {
      final userId = 28;
      final startDate = DateTime(2024, 7, 1);
      final taskId = 213;
      final record = await client.getTimeTrackRecord(userId, startDate, taskId);
      expect(record.taskId, taskId);
    });
  });
}
