class Question {
  int questionId;
  int accountId;
  String accountName;
  String title;
  String createdAt;

  Question({ this.questionId, this.accountId, this.accountName, this.title, this.createdAt });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['question_id'],
      accountId: json['account_id'],
      accountName: json['account_name'] ?? '',
      title: json['title'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'question_id': questionId,
    'account_id': accountId,
    'account_name': accountName,
    'title': title,
    'created_at': createdAt,
  };

  @override
  String toString() {
    return 'Question{questionId: $questionId, accountId: $accountId, accountName: $accountName, title: $title, createdAt: $createdAt}';
  }
}
