<?php
    class Views{

        public function getView($controlador, $vista)
        {
            $controlador = get_class($controlador);
            if ($controlador == "Home") {
                $vista = "views/". $vista . ".php";
            }else{
                $vista = "Views/" . $controlador . "/" . $vista. ".php";
            }

            require $vista;
        }
    }

?>