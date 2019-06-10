

import 'package:http/http.dart' as http;


class UserAgentClient extends http.BaseClient {
	final String userAgent;
	final http.Client _inner;
	
	UserAgentClient(this.userAgent, this._inner);
	
	@override
	Future<http.StreamedResponse> send(http.BaseRequest request) {
		request.headers['user-agent'] = userAgent;
		return _inner.send(request);
	}
}

class CustomHeadersClient extends http.BaseClient {
	final Map<String, String> allHeaders;
	final http.Client _inner;
	
	CustomHeadersClient(this.allHeaders, this._inner);
	
	@override
	Future<http.StreamedResponse> send(http.BaseRequest request) {
		this.allHeaders.forEach((key, value) {
			if(key != null){
				request.headers[key] = value;
			}
		});
		return _inner.send(request);
	}
}