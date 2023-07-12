// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "todos", primaryKeys: [])
class TodosEntity extends Equatable {
  final int? userId;
  @primaryKey
  final int? id;
  final String? title;
  final bool? completed;
  const TodosEntity({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  @override
  List<Object?> get props => [userId, id, title, completed];
}
