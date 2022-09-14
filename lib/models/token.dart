class Token {
  String session;
  String refresh;

  Token(this.session, this.refresh);

  factory Token.fromJSON(Map<String, dynamic> json) {
    return Token(json['session'], json['refresh']);
  }
}
