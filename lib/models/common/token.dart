class TokenObj {
  String accessToken;

  String refreshToken;

  TokenObj({this.accessToken = '', this.refreshToken = ''});

  factory TokenObj.fromJson(Map<String, dynamic> json) {
    return TokenObj(accessToken: json['access_token'], refreshToken: json['refresh_token']);
  }

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
