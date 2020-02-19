class Rate {
  int rateId;
  int questionId;
  int accountId;
  double rating;
  String comment;

  Rate(
      {this.rateId,
      this.questionId,
      this.accountId,
      this.rating,
      this.comment});

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      rateId: json['rate_id'],
      questionId: json['question_id'],
      accountId: json['account_id'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() => {
        'rate_id': rateId,
        'question_id': questionId,
        'account_id': accountId,
        'rating': rating,
        'comment': comment,
      };

  @override
  String toString() {
    return 'Rate{rateId: $rateId, questionId: $questionId, accountId: $accountId, rating: $rating, comment: $comment}';
  }
}
