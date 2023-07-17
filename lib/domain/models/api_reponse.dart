class ApiResponse {
  final String get;
  final List<Map<String, String>>? parameters;
  final List<dynamic>? errors;
  final int results;
  final Map <String, String> paging;
  final dynamic response;

  ApiResponse ({
      required this.get,
      this.parameters,
      this.errors,
      required this.results,
      required this.paging,
      required this.response});

  factory ApiResponse.fromJson (Map<String, dynamic> json ) {
    return ApiResponse(
        get: json["get"],
        errors: json["errors"],
        parameters: json["parameters"],
        results: json["results"],
        paging: json["paging"],
        response: json["response"],
    );
  }

  Map<String, dynamic> toJson (){
    return {
      "get" : get,
      "parameters" : parameters ?? {},
      "errors" : errors,
      "results" : results,
      "paging" : paging,
      "response" : response,
    };
  }

}