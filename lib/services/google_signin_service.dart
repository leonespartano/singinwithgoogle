import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;


class GoogleSignInService {

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ],
  );

  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try{


      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;

      
      print(account);
      print('=======  ID TOKEN ==========');
      print(googleKey.idToken);

      // final signInWithGoogleEndPoint = Uri(
      //   scheme: 'https',
      //   host: 'node-google-sign-in.herokuapp.com',
      //   path:'/google'
      // );

      print('i comienzo');

      // final signInWithGoogleEndPoint = Uri(
      //   scheme: 'http',
      //   host: '192.168.0.102:8080',
      //   path:'/DegoHambo/ws/customer/google/login'
      // );

      // final signInWithGoogleEndPoint = Uri.http(
      //   "192.168.0.102:8080", 
      //   "/prueba/signin/google/token"
      // );

      final signInWithGoogleEndPoint = Uri.http(
        "192.168.0.102:8080", 
        "/DegoHambo/ws/customer/google/login"
      );

      print('i Intermedio');


      final session = await http.post(
        signInWithGoogleEndPoint, 
        body: {
          'idtoken': googleKey.idToken
        }
      );

      // await http.post("http://192.168.0.102/prueba/signin/google/token",
      //               headers: headers,
      //               body: json.encode(data))


      print('=========== backend ===========');
      print( session.body );

      return account;


    }catch(e){
      print('Error en google Signin');
      print(e);
      return null;
    }
  }

  static Future signOut() async{
    await _googleSignIn.signOut();
    print('Salida exitosa');
  }


}