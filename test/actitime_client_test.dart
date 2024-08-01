import 'package:actitime_client/actitime_client.dart';
import 'package:test/test.dart';

void main() {
  final client = ActitimeClient(username: "silvestri", password: "maigab11");

  group("Test customers", () {
    test("Get customers", () async {
      final customers = await client.getCustomers(limit: 3);
      expect(customers.toList().length, 3);
    });

    test("Get customer by id", () async {
      final customer = await client.getCustomerById(7);
      expect(customer.id, 7);

      expect(() async {
        await client.getCustomerById(1);
      }, throwsA(isA<ActitimeApiException>()));
    });
  });

  group("Test projects", () {
    test("Get projects", () async {
      final projects = await client.getProjects(offset: 10, limit: 4);
      expect(projects.toList().length, 4);
    });

    test("Get project by id", () async {
      final project = await client.getProjectById(4);
      expect(project.id, 4);
    });
  });

  group("Test tasks", () {
    test("Get tasks", () async {
      final tasks = await client.getTasks(limit: 5);
      expect(tasks.toList().length, 5);
    });

    test("Get task by id", () async {
      final taskId = 65;
      final task = await client.getTaskById(taskId);
      expect(task.id, taskId);
    });
  });

  group('Test users', () {
    test('Get users', () async {
      final users = (await client.getUsers(limit: 3)).toList();
      expect(users.length, 3);
    });

    test("Get current user", () async {
      final me = await client.currentUser;
      expect(me.lastName, "Silvestri");
    });

    test("Get user by id", () async {
      final user = await client.getUserById(28);
      expect(user.id, 28);
    });
  });

  group("Test time track", () {
    test("Get time track", () async {
      final startDate = DateTime(2024, 7, 1);
      final timetrack =
          await client.getTimeTrack(userIds: [28], dateFrom: startDate);
      expect(timetrack.dateFrom, startDate);
    });

    test("Get time track records", () async {
      final startDate = DateTime(2024, 7, 1);
      final taskId = 213;
      final record = await client.getTimeTrackRecord(28, startDate, taskId);
      expect(record.taskId, taskId);
    });
  });
}
