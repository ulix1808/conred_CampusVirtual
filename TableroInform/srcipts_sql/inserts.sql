INSERT INTO public.home_riesgo(id, name, min_ri, max_ri, color_ri, min_pelyexp, max_pelyexp, color_pelyexp, min_vul, max_vul, color_vul, min_capres, max_capres, color_capres)
VALUES	(0, 'Todos',	0, 11, '', 0, 11, '', 0, 11, '', 0, 11, ''),
		(1, 'Muy Bajo', 0, 1.9, 	'ffbebe', 0, 1.4,	'ffebaf', 0, 1.9,	'bee8ff', 0, 3.1, 'e9ffbe'),
		(2, 'Bajo',		2.0, 3.4, 	'ff7f7f', 1.5, 2.6,	'ffaa00', 2.0, 3.2,	'00c5ff', 3.2, 4.6, 'd1ff73'),
		(3, 'Medio',	3.5, 4.9, 	'ff0000', 2.7, 4.0,	'a87000', 3.3, 4.7, '00a9e6', 4.7, 5.9, '98e600'),
		(4, 'Alto',		5.0, 6.4, 	'a80000', 4.1, 6.0, '734c00', 4.8, 6.3, '0084a8', 6.0, 7.3, '70a800'),
		(5, 'Muy Alto', 6.5, 10., 	'730000', 6.1, 10,	'732600', 6.4, 10, '004c73', 7.4, 10, '4c7300');

INSERT INTO public.home_nivel(id, name)
	VALUES 	(1, 'Primario'),
			(2, 'Secundario'),
			(3, 'Terceario');


INSERT INTO public.home_indicador(
	id, name, name_db, nivel_id)
	VALUES		(1, 'Eventos Naturales', 'eventos_naturales', 1),
				(2, 'Degradacion Ambiental', 'degradacion_ambiental', 1),
				(3, 'INFORM HUMANO', 'inform_humano', 1),
				(4, 'INFORM NATURAL', 'inform_natural', 1),
				(5, 'Peligro y exposición', 'peligro_y_exposicion', 1),
				(6, 'Desarrollo económico', 'desarrollo_economico', 1),
				(7, 'Desigualdad', 'desigualdad', 1),
				(8, 'Desarrollo y pobreza', 'desarrollo_y_pobreza', 1),
				(9, 'Población en dependencia', 'poblacion_en_dependencia', 1),
				(10, 'Población desprotegida', 'poblacion_desprotegida', 1),
				(11, 'Socioeconómica', 'socioeconomica', 1),
				(12, 'Grupos Vulnerables', 'grupos_vulnerables', 1),
				(13, 'Vulnerabilidades', 'vulnerabilidades', 1),
				(14, 'RRD', 'rrd', 1),
				(15, 'Gestión Municipal', 'gestion_municipal', 1),
				(16, 'Comunicación', 'comunicacion', 1),
				(17, 'Infraestructura', 'infraestructura', 1),
				(18, 'Salud', 'salud', 1),
				(19, 'INFORM Institucional', 'inform_institucional', 1),
				(20, 'INFORM Infraestrucutra', 'inform_infraestrucutra', 1),
				(21, 'FALTA DE CAPACIDAD DE RESPUESTA', 'falta_capacidad_respuesta', 1),
				(22, 'INFORM RISK', 'inform_risk', 1),
				(23, 'Ranking', 'ranking', 1),
				(24, 'Missing Indicators', 'missing_indicators', 1);
