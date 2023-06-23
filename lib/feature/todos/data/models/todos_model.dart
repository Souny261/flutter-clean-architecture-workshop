import 'package:workshop/feature/todos/domain/entities/todos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos_model.g.dart';

@JsonSerializable()
class TodosModel extends TodosEntity {
  @override
  final int? userId;

  @override
  final int? id;

  @override
  final String? title;

  @override
  final bool? completed;

  const TodosModel({this.userId, this.id, this.title, this.completed});

  factory TodosModel.fromJson(Map<String, dynamic> json) =>
      _$TodosModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodosModelToJson(this);
}
