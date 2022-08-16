
class Todosmodel {
  final String title;
  final int id, uid;
  final bool complete;
  factory Todosmodel.fromjson(Map<String, dynamic> myjson) {
    return Todosmodel(
        myjson['title'], myjson['id'], myjson['userId'], myjson['completed']);
  }
  Todosmodel(this.title, this.id, this.uid, this.complete);
}
