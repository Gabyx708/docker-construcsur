SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE cliente(

	dni_cli BIGINT PRIMARY KEY,
	nombre_y_apellido VARCHAR(80),
	email VARCHAR(50),
	direccion VARCHAR(70),
	celular INT NOT NULL
);

CREATE TABLE empleado(

	dni_emp BIGINT PRIMARY KEY,
	apodo VARCHAR(20),
	nombre_y_apellido VARCHAR(80),
	celular INT NOT NULL,
	email VARCHAR(50)
);

/*------TABLA DE OBRAS--------*/

CREATE TABLE obra(

	codigo VARCHAR(5) PRIMARY KEY,
	nombre_Obra VARCHAR(50),
	direccion VARCHAR(80),
	presupuesto INT NOT NULL,
	moneda VARCHAR(5) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin    DATE ,
	cliente BIGINT,

	 FOREIGN KEY(cliente) REFERENCES cliente(dni_cli)
);

CREATE TABLE gastos(

	obra VARCHAR(5), FOREIGN KEY(obra) REFERENCES obra(codigo),
	descripcion VARCHAR(100),
	fecha DATE,
	n_factura VARCHAR(30),
	monto INT

);

CREATE TABLE puesto(

		cargo VARCHAR(15) PRIMARY KEY,
		sueldo_x_dia INT NOT NULL

);

CREATE TABLE pagos(

	obra VARCHAR(5), FOREIGN KEY(obra) REFERENCES obra(codigo),
	FECHA DATE,
	monto INT NOT NULL

);

/*---tablas que relacionan empleados con obras---*/

CREATE TABLE trabajo_obra(

		obra VARCHAR(5), FOREIGN KEY(obra) REFERENCES obra(codigo),
		empleado BIGINT, FOREIGN KEY(empleado) REFERENCES empleado(dni_emp),
		puesto VARCHAR(15), FOREIGN KEY(puesto) REFERENCES puesto(cargo)

);


CREATE TABLE asistencia_semanal(

		fecha_inicio DATE,
		fecha_fin DATE,
		empleado BIGINT, FOREIGN KEY(empleado) REFERENCES empleado(dni_emp),

		/*--DIAS--*/

		lun VARCHAR(5) ,FOREIGN KEY(lun) REFERENCES obra(codigo),
		mar VARCHAR(5) ,FOREIGN KEY(mar) REFERENCES obra(codigo),
		mie VARCHAR(5) ,FOREIGN KEY(mie) REFERENCES obra(codigo),
		jue VARCHAR(5) ,FOREIGN KEY(jue) REFERENCES obra(codigo),
		vie VARCHAR(5) ,FOREIGN KEY(vie) REFERENCES obra(codigo),
		sab VARCHAR(5) ,FOREIGN KEY(sab) REFERENCES obra(codigo),
		dom VARCHAR(5) ,FOREIGN KEY(dom) REFERENCES obra(codigo)

);

/*--RESUMENES MENSUALES--*/

CREATE TABLE resumen_mensual(

			obra VARCHAR(5), FOREIGN KEY(obra) REFERENCES obra(codigo),

			mes VARCHAR(20),
			fecha_inicio DATE NOT NULL,
			fecha_fin DATE NOT NULL,

			total_jornales INT,
			total_gastos INT,
			total_pagos INT

);
