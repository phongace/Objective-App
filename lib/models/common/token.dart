class TokenObj {
  String accessToken;

  String refreshToken;

  TokenObj({this.accessToken = '', this.refreshToken = ''});

  factory TokenObj.fromJson(Map<String, dynamic> json) {
    return TokenObj(accessToken: json['accessToken'], refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
