class AppException implements Exception {
  
  // ignore: prefer_typing_uninitialized_variables
  final _message ;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix ;

  AppException ([this._message, this._prefix]);

  @override
  String toString(){
    return "$_prefix$_message";
  }
  
}

class InternetException extends AppException {
  InternetException([String? message]): super(message,"No Internet");  
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]): super(message,"Request Time Out");  
}

class ServerException extends AppException {
  ServerException([String? message]): super(message,"internal server error");  
}


