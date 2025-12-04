import 'dart:convert';
import 'package:actitime_client/actitime_client.dart';
import 'package:actitime_client/src/user.dart';
import 'package:actitime_client/src/utils.dart';
import 'package:http/http.dart' as http;

export './allowed_actions.dart' show AllowedActions;
export './api_error.dart' show ApiError;
export './comment.dart' show Comment, CommentList;
export './customer.dart'
    show Customer, CustomerWithAllowedActions, CustomerList;
export './department.dart' show Department, DepartmentList;
export './leave_time.dart'
    show
        LeaveType,
        LeaveTypeList,
        LeaveTypeBalance,
        LeaveTimeList,
        LeaveTimeRecord;
export './project.dart' show Project, ProjectWithAllowedActions, ProjectList;
export './task.dart' show Task, TaskWithAllowedActions, TaskList;
export './time_track.dart'
    show TimeTrackList, TimeTrackRecord, UserDayTTDataWithDayOffset;
export './time_zone_group.dart' show TimeZoneGroup;
export './type_of_work.dart' show TypeOfWork;
export './user.dart'
    show
        User,
        UserAllowedActions,
        UserWithAllowedActions,
        UserSchedule,
        UserList;
export './workflow_status.dart'
    show
        WorkflowType,
        WorkflowStatus,
        WorkflowStatusWithAllowedActions,
        WorkflowStatusList;

class ApiException implements Exception {
  final int code;
  final String? reason;

  ApiException(this.code, this.reason);
}

/// An actitime client
class ActitimeClient {
  late final String basicAuth;
  final String authority;
  final String basePath;

  ActitimeClient(
      {required this.basicAuth,
      required this.authority,
      this.basePath = '/api/v1'});

  ActitimeClient.credentials(
      {required String username,
      required String password,
      required this.authority,
      this.basePath = '/api/v1'})
      : basicAuth = base64.encode(utf8.encode("$username:$password"));

  Uri _buildPath(String path, [Map<String, String>? queryParams]) {
    final uriPath = "$basePath/$path".replaceAll("//", "/");
    return Uri.http(authority, uriPath, queryParams);
  }

  Map<String, String> get _headers => {'authorization': 'Basic $basicAuth'};

  Future<Map<String, dynamic>> _get(String path,
      [Map<String, String>? queryParams]) async {
    final url = _buildPath(path, queryParams);
    final response = await http.get(url, headers: _headers);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode != 200) {
      if (json.containsKey("key") && json.containsKey("message")) {
        final e = ApiError.fromJson(json);
        throw e;
      }
      throw ApiException(response.statusCode, response.reasonPhrase);
    }
    return json;
  }

  // ===== Customers =====

  Future<CustomerList> getCustomers([Map<String, String>? queryParams]) async {
    final json = await _get('/customers', queryParams);
    return CustomerList.fromJson(json);
  }

  Future<CustomerWithAllowedActions> getCustomerById(int id) async {
    final json = await _get('/customers/$id');
    return CustomerWithAllowedActions.fromJson(json);
  }

  Future<CommentList> getCustomerComments(int id,
      [Map<String, String>? queryParams]) async {
    final json = await _get("/customers/$id/comments", queryParams);
    return CommentList.fromJson(json);
  }

  // ===== Leave time =====

  Future<LeaveTimeList> getLeaveTime(DateTime dateFrom,
      [Map<String, String>? queryParams]) async {
    queryParams ??= {};
    queryParams.putIfAbsent("dateFrom", () => dateToJson(dateFrom));
    final json = await _get("/leavetime");
    return LeaveTimeList.fromJson(json);
  }

  Future<LeaveType> getLeaveTypeById(int id) async {
    final json = await _get("/leaveTypes/$id");
    return LeaveType.fromJson(json);
  }

  Future<LeaveTypeList> getLeaveTypes(
      [Map<String, String>? queryParams]) async {
    final json = await _get('/leaveTypes', queryParams);
    return LeaveTypeList.fromJson(json);
  }

  // ===== Projects =====

  Future<ProjectWithAllowedActions> getProjectById(int id) async {
    final json = await _get("/projects/$id");
    return ProjectWithAllowedActions.fromJson(json);
  }

  Future<ProjectList> getProjects([Map<String, String>? queryParams]) async {
    final json = await _get("/projects", queryParams);
    return ProjectList.fromJson(json);
  }

  Future<CommentList> getProjectList(int id,
      [Map<String, String>? queryParams]) async {
    final json = await _get("/projects/$id/comments", queryParams);
    return CommentList.fromJson(json);
  }

  // ===== Tasks =====

  Future<TaskWithAllowedActions> getTaskById(int id) async {
    final json = await _get("/tasks/$id");
    return TaskWithAllowedActions.fromJson(json);
  }

  Future<TaskList> getTasks([Map<String, String>? queryParams]) async {
    final json = await _get("/tasks", queryParams);
    return TaskList.fromJson(json);
  }

  Future<CommentList> getTaskComments(int id,
      [Map<String, String>? queryParams]) async {
    final json = await _get("/tasks/$id/comments", queryParams);
    return CommentList.fromJson(json);
  }

  // ===== Timetrack =====

  /// Returns one time-track record
  Future<TimeTrackRecord> getTimeTrackRecord(
      int userId, DateTime date, int taskId) async {
    final json = await _get("/timetrack/$userId/${dateToJson(date)}/$taskId");
    return TimeTrackRecord.fromJson(json);
  }

  /// Returns several time-track records according to provided query.
  Future<TimeTrackList> getTimeTrack(DateTime dateFrom,
      [Map<String, String>? queryParams]) async {
    queryParams ??= {};
    queryParams.putIfAbsent("dateFrom", () => dateToJson(dateFrom));
    final json = await _get("/timetrack", queryParams);
    return TimeTrackList.fromJson(json);
  }

  // ===== Users =====

  Future<UserList> getUsers([Map<String, String>? queryParams]) async {
    final json = await _get('/users', queryParams);
    return UserList.fromJson(json);
  }

  Future<UserWithAllowedActions> getUserById(int id) async {
    final json = await _get("/users/$id");
    return UserWithAllowedActions.fromJson(json);
  }

  Future<UserWithAllowedActions> getMe() async {
    final json = await _get("/users/me");
    return UserWithAllowedActions.fromJson(json);
  }

  Future<UserSchedule> getUserSchedule(int id, DateTime dateFrom,
      [DateTime? dateTo]) async {
    final queryParams = {
      "dateFrom": apiDateFormat.format(dateFrom),
    };
    if (dateTo != null) {
      queryParams["dateTo"] = apiDateFormat.format(dateTo);
    }
    final json = await _get("/users/$id/schedule", queryParams);
    return UserSchedule.fromJson(json);
  }
}
