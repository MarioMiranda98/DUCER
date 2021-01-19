class QuestionResponseModel {
  final int questionIndex;
  bool response;
  final String childProblem;

  QuestionResponseModel({
    this.questionIndex, 
    this.response,
    this.childProblem
  });
}