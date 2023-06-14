<?php 

class loginController extends Controller {
  function __construct()
  {
    if (Auth::validate()) {
      Flasher::new('Ya hay una sesión abierta.');
      Redirect::to('home/flash');
    }
  }

  function index()
  {
    $data =
    [
      'title'   => 'Ingresar a tu cuenta',
      'padding' => '0px'
    ];

    View::render('index', $data);
  }

  function post_login()
  {
    try {
      if (!Csrf::validate($_POST['csrf']) || !check_posted_data(['email','csrf','password'], $_POST)) {
        Flasher::new('Acceso no autorizado.', 'danger');
        Redirect::back();
      }
  
      // Data pasada del formulario
      $email  = clean($_POST['email']);
      $password = clean($_POST['password']);
     
        // Verificar si el email es válido
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
          throw new Exception('El correo electrónico no es válido');
        }

        // verificar que el usuario existente coincida con el email
        if(!$user = usuarioModel::by_email($email)){
          throw new Exception('Las correo no son correctas.');
        }
        
        if (password_verify($password.AUTH_SALT, $user['password'])) {
          throw new Exception('Las contraseña no son correctas.');
        }

        // Loggear al usuario
        Auth::login($user['id'], $user);
        Redirect::to('dashboard');

      }catch (Exception $e){
      Flasher::new($e->getMessage(), 'danger');
      Redirect::back();
      } catch (PDOException $e){
        Flasher::new($e->getMessage(), 'danger');
        Redirect::back();
        }





  }
}