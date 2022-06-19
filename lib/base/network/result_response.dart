class ResultResponse<T> {
  ResultResponse(this.content);

  late int status;
  late ErrorData errorData;
  late T content;

  T getData() {
    return content;
  }

  void setData(T content) {
    this.content = content;
  }

  ErrorData getError() {
    return errorData;
  }
}

class Success extends ResultResponse {
  Success(contentFromApi) : super(null) {
    content = contentFromApi;
  }
}

class Error extends ResultResponse {
  Error(ErrorData errorDataFromApi) : super(null) {
    errorData = errorDataFromApi;
  }
}

class ErrorData {
  int errorCode = 0;
  String errorMessage = '';

  ErrorData(this.errorMessage, this.errorCode);
}
