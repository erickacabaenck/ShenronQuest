# Global.gd
extends Node

var vidas_maximas: int = 3
var vidas: int = 3  
var tiempo_total: float = 420.0
var tiempo_restante: float = 420.0
var detener_tiempo: bool = false

func resetear_juego():
	vidas = vidas_maximas
	tiempo_restante = tiempo_total
	detener_tiempo = false 
