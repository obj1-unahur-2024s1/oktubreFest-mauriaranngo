import pacientes.*

class Aparato{
	var property color = "blanco"
	method esRojo() = color == "rojo"
	method serUsado(unPaciente)
	method puedeSerUsado(unPaciente)
	method realizarMantenimiento()
	method estaEnCondiciones()
}

class Magneto inherits Aparato{
	var imantacion = 800
	override method serUsado(unPaciente){
		self.perderImantacion()
		unPaciente.disminuirDolorPorcentual(10)
	}
	override method puedeSerUsado(unPaciente) = true
	 method perderImantacion(){
		imantacion -= 1
		//if (imantacion == 100){self.realizarMantenimiento()}
	}	
	override method realizarMantenimiento(){
		imantacion += 500
	}
	override method estaEnCondiciones() = imantacion > 100
		
}

class Bicicleta inherits Aparato{
	var  tornillosDesajustados = 0
	var  aceitePerdido = 0
	override method serUsado(unPaciente){
		//if (self.puedeSerUsado(unPaciente)){
		//unPaciente.disminuirDolor(4)
		//unPaciente.aumentarFortaleza(3)}
		if (unPaciente.nivelDeDolor()>30){self.perderTornillo()}
		if (unPaciente.edad().between(30,50)){self.perderAceite()}
		unPaciente.disminuirDolor(4)
		unPaciente.aumentarFortaleza(3)
	}
	
	override method puedeSerUsado(unPacientes) = unPacientes.edad() > 8
		
	 method perderTornillo(){
		tornillosDesajustados += 1
		//if (tornillosDesajustados == 10)self.realizarMantenimiento()
	}
	method perderAceite(){
		aceitePerdido += 1
		//if (aceitePerdido == 5)self.realizarMantenimiento()
	}
	override method realizarMantenimiento(){
		tornillosDesajustados = 0
		aceitePerdido = 0
	}
	override method estaEnCondiciones() = tornillosDesajustados < 10 and aceitePerdido<5
}

class MiniTrap inherits Aparato{
	override method serUsado(unPaciente){
		//if (self.puedeSerUsado(unPaciente)){
		//unPaciente.aumentarFortalezaNivelPorcentual(10)}
		unPaciente.aumentarFortalezaNivelPorcentual(10)
	}
	override method puedeSerUsado(unPaciente)= unPaciente.nivelDeDolor()<20
	override method realizarMantenimiento(){}
	override method estaEnCondiciones() = true
}