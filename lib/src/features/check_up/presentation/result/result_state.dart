// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultState {
  int? result;

  ResultState({this.result});

  ResultState copyWith({
    int? result,
  }) {
    return ResultState(
      result: result ?? this.result,
    );
  }
}
