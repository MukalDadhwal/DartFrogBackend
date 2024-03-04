import 'package:dart_frog/dart_frog.dart';

// auth/get_user_profile

Response onRequest(RequestContext context) {
  switch (context.request.method.value) {
    case 'GET':
      return _returnProfile(context.request);

    default:
      return Response.json(body: 'Not a valid http request');
  }
}

Response _returnProfile(Request request) {
  final hasToken = request.headers['token'] ?? 'nothing';

  if (hasToken == 'nothing') {
    return Response.json(
      body: 'No auth token provided in the request',
    );
  }

  if (request.headers['token']!.contains('isvalid')) {
    return Response.json(
      body: {
        'username': 'Mukal Dadhwal',
        'profileid': '10293',
        'email': 'mukal@flutter.com'
      },
    );
  }
  return Response.json(body: 'Not a valid jwt token');
}
