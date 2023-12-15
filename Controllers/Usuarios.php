<?php
    class Usuarios extends Controller{
        public function __construct()
        {
            session_start();
            parent::__construct();
        }
        public function index()
        {

            $this->views->getView($this, "index");
        }

        public function validar()
        {
            if (empty($_POST['usuario']) || empty($_POST['pass'])) {
                $msg = "Los campos estan vacios";
            }else{
                $usuario = $_POST['usuario'];
                $pass = $_POST['pass'];
                $data = $this->model->getUsuario($usuario, $pass);
                if ($data) {
                    $_SESSION['id_usuario'] = $data['ID'];
                    $_SESSION['Rol'] = $data['Rol'];
                    $_SESSION['email'] = $data['email'];
                    $_SESSION['nombre'] = $data['nombre'];
                    $msg = "ok";
                }else{
                    $msg = "Email o contraseña incorrectos";
                }
            }
            echo json_encode($msg, JSON_UNESCAPED_UNICODE);
            die();
        }
    }


?>