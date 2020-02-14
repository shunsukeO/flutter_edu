class Question {
  String questionId;
  String userId;
  String title;

  Question({ this.questionId, this.userId, this.title });
  Question.init({ this.questionId, this.userId }) {
    questionId = '';
    userId = '';
    title = '';
  }
}