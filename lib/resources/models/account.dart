class Account {
  String accountId;
  String email;
  String password;
  String role;

  Account({ this.accountId, this.email, this.password, this.role });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json['accountId'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
    'accountId': accountId,
    'email': email,
    'password': password,
    'role': role,
  };

  @override
  String toString() {
    return 'Account{accountId: $accountId, email: $email, password: $password, role: $role}';
  }
}