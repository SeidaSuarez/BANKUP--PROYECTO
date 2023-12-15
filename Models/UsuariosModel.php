<?php
    class UsuariosModel extends query{
        public function __construct()
        {
            parent::__construct();
        }

        public function getUsuario(string $usuario, string $pass)
        {
            $sql = "SELECT * FROM usuario WHERE email='$usuario' AND pass = '$pass'";
            $data = $this->select($sql);
            return $data;
        }

        public function getUsuarios()
        {
            $sql = "SELECT * FROM usuario";
            $data = $this->selectAll($sql);
            return $data;
        }
    }
?>