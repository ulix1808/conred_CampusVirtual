INSERT INTO public.home_riesgo(id, name, min_ri, max_ri, color_ri, min_pelyexp, max_pelyexp, color_pelyexp, min_vul, max_vul, color_vul, min_capres, max_capres, color_capres)
VALUES	(0, 'Todos',	0, 11, '', 0, 11, '', 0, 11, '', 0, 11, ''),
		(1, 'Muy Bajo', 0, 3.5, 	'ffbebe', 0, 2.6,	'ffebaf', 0, 3.0,	'bee8ff', 0, 3.0, 'e9ffbe'),
		(2, 'Bajo',		3.6, 4.5, 	'ff7f7f', 2.7, 3.6,	'ffaa00', 3.1, 4.1,	'00c5ff', 3.1, 4.1, 'd1ff73'),
		(3, 'Medio',	4.6, 5.1, 	'ff0000', 3.7, 4.5,	'a87000', 4.2, 5.0, '00a9e6', 4.2, 5.6, '98e600'),
		(4, 'Alto',		5.2, 6.0, 	'a80000', 4.6, 6.0, '734c00', 5.1, 6.6, '0084a8', 5.7, 7.0, '70a800'),
		(5, 'Muy Alto', 6.1, 10.0, 	'730000', 6.1, 10.0,	'732600', 6.7, 10.0, '004c73', 7.1, 10.0, '4c7300');