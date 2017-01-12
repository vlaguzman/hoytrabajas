<?php

	
    public static function getFechaSys(){
         date_default_timezone_set('America/Bogota');
         $fecha_ = date("Y-m-d", time());
         $hora_=  date("H:i:s", time());
         return $fecha_.$hora_;
    }

