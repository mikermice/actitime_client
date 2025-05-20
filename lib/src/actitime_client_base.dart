import 'dart:convert';
import 'package:actitime_client/actitime_client.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

export './api_error.dart' show ActitimeApiException;
export './customer.dart' show ActitimeCustomer;
export './item_list.dart' show ItemList;
export './project.dart' show ActitimeProject;
export './task.dart' show ActitimeTask;
export './time_track.dart'
    show ActitimeTimeTrack, ActitimeTimeTrackData, ActitimeTimeTrackRecord;
export './user.dart' show ActitimeUser;

final _dateFormatter = DateFormat("yyyy-MM-dd");

/// An actitime client
class ActitimeClient {
  late final String basicAuth;
  final String authority;
  final String basePath;

  ActitimeClient(
      {required this.basicAuth,
      this.authority = "192.168.0.23:120",
      this.basePath = '/api/v1'});

  ActitimeClient.credentials(
      {required String username,
      required String password,
      this.authority = "192.168.0.23:120",
      this.basePath = '/api/v1'})
      : basicAuth = base64.encode(utf8.encode("$username:$password"));

  Uri _buildPath(String path, [Map<String, dynamic>? queries]) {
    final uriPath = "$basePath/$path".replaceAll("//", "/");
    return Uri.http(authority, uriPath, queries);
  }

  Map<String, String> get _headers => {'authorization': 'Basic $basicAuth'};

  Future<Map<String, dynamic>> _get(String path,
      [Map<String, dynamic>? query]) async {
    final url = _buildPath(path, query);
    final response = await http.get(url, headers: _headers);
    final json = jsonDecode(response.body);
    ActitimeApiException? e;
    try {
      e = ActitimeApiException.fromJson(json);
    } catch (_) {}

    if (e != null) {
      throw e;
    }
    return json;
  }

  Future<ItemList> _getItems(String path, int? offset, int? limit) async {
    final Map<String, dynamic> query = {};
    if (offset != null) {
      query['offset'] = offset.toString();
    }
    if (limit != null) {
      query['limit'] = limit.toString();
    }
    final json = await _get(path, query);
    final items = ItemList.fromJson(json);
    return items;
  }

  Future<Iterable<ActitimeProject>> getProjects(
      {int? offset, int? limit}) async {
    final items = await _getItems("/projects", offset, limit);
    return items.items.map((json) => ActitimeProject.fromJson(json));
  }

  Future<ActitimeProject> getProjectById(int id) async {
    final json = await _get("/projects/$id");
    return ActitimeProject.fromJson(json);
  }

  Future<Iterable<ActitimeTask>> getTasks({int? offset, int? limit}) async {
    final items = await _getItems("/tasks", offset, limit);
    return items.items.map((json) => ActitimeTask.fromJson(json));
  }

  Future<ActitimeTask> getTaskById(int id) async {
    final json = await _get("/tasks/$id");
    return ActitimeTask.fromJson(json);
  }

  Future<Iterable<ActitimeUser>> getUsers({int? offset, int? limit}) async {
    final items = await _getItems('/users', offset, limit);
    return items.items.map((json) => ActitimeUser.fromJson(json));
  }

  Future<ActitimeUser> getUserById(int id) async {
    final json = await _get("/users/$id");
    return ActitimeUser.fromJson(json);
  }

  Future<Iterable<ActitimeCustomer>> getCustomers(
      {int? offset, int? limit}) async {
    final items = await _getItems("/customers", offset, limit);
    return items.items.map((json) => ActitimeCustomer.fromJson(json));
  }

  Future<ActitimeCustomer> getCustomerById(int id) async {
    final json = await _get('/customers/$id');
    return ActitimeCustomer.fromJson(json);
  }

  Future<ActitimeTimeTrack> getTimeTrack(
      {List<int>? userIds,
      List<int>? projectIds,
      List<int>? taskIds,
      List<int>? customerIds,
      DateTime? dateFrom,
      DateTime? dateTo,
      int? stopAfter}) async {
    final Map<String, dynamic> query = {};
    if (userIds != null) {
      query['userIds'] = userIds.map((id) => id.toString()).join(',');
    }
    if (taskIds != null) {
      query['taskIds'] = taskIds.map((id) => id.toString()).join(',');
    }
    if (projectIds != null) {
      query['projectIds'] = projectIds.map((id) => id.toString()).join(',');
    }
    if (customerIds != null) {
      query['customerIds'] = customerIds.map((id) => id.toString()).join(',');
    }
    if (dateFrom != null) {
      query['dateFrom'] = _dateFormatter.format(dateFrom);
    }
    if (dateTo != null) {
      query['dateTo'] = _dateFormatter.format(dateTo);
    }
    if (stopAfter != null) {
      query['stopAfter'] = stopAfter.toString();
    }

    final json = await _get("/timetrack", query);
    return ActitimeTimeTrack.fromJson(json);
  }

  Future<ActitimeTimeTrackRecord> getTimeTrackRecord(
      int userId, DateTime date, int taskId) async {
    final dateFmt = _dateFormatter.format(date);
    final json = await _get('/timetrack/$userId/$dateFmt/$taskId');
    return ActitimeTimeTrackRecord.fromJson(json);
  }

  Future<ActitimeUser> get currentUser async {
    final json = await _get('/users/me');
    return ActitimeUser.fromJson(json);
  }
}
