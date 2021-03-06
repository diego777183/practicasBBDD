insert into tipo_centro(tipo_centro)
select distinct tipo_centro from plazasOfertadas

insert into localidad(nom_localidad)
select distinct localidad from alumnosEgresados 

insert into centro(nom_centro, id_tipo_centro, id_localidad)
select distinct p.centro, c.id_tipo_centro, l.id_localidad 
from plazasOfertadas p, tipo_centro c, localidad l
where c.tipo_centro = p.tipo_centro and l.nom_localidad = p.localidad

insert into tipo_estudio(tipo_estudio)
select distinct p.tipo_estudio
from plazasOfertadas p

insert into estudios(nom_estudio, id_tipo_estudio)
select distinct(p.estudio), t.id_tipo_estudio
from plazasOfertadas p, tipo_estudio t, resultadosTitulaciones r, notasCorte n, alumnosEgresados a
where p.tipo_estudio = t.tipo_estudio and p.estudio = r.estudio and p.estudio = n.estudio and 
p.estudio = a.estudio and r.estudio = n.estudio and r.estudio = a.estudio and n.estudio = a.estudio

insert into imparte(nom_centro, nom_estudio)
select distinct (p.centro), p.estudio
from plazasOfertadas p, estudios e, centro c
where c.nom_centro = p.centro and e.nom_estudio = p.estudio

insert into cursos(nom_centro, nom_estudio, curso_academico, plazas_matriculadas, plazas_ofertadas, plazas_solicitadas, indice_ocupacion, alumnos_graduados, tasa_abandono, tasa_eficiencia, tasa_exito, tasa_graduados, alumnos_matriculados, alumnos_nuevos, nota_corte_julio, nota_corte_septiembre)
select i.nom_centro, i.nom_estudio, p.curso_academico, p.plazas_matriculadas, p.plazas_ofertadas, p.plazas_solicitadas, p.indice_ocupacion, r.alumnos_graduados, r.tasa_abandono, r.tasa_eficiencia, r.tasa_exito, r.tasa_graduacion, r.alumnos_matriculados, r.alumnos_nuevo_ingreso, n.nota_corte_definitiva_julio, n.nota_corte_definitiva_septiembre
from plazasOfertadas p, imparte i, notasCorte n, resultadosTitulaciones r
where i.nom_estudio = p.estudio and i.nom_centro = p.centro and i.nom_estudio = n.estudio and
      i.nom_centro = n.centro and i.nom_estudio = r.estudio and i.nom_centro = r.centro and 
      p.curso_academico = n.curso_academico and p.curso_academico = r.curso_academico and 
      n.curso_academico = r.curso_academico

insert into idioma(nom_idioma)
select distinct a.nombre_idioma_nivel_movilidad
from acuerdosMovilidad a

insert into areaEstudiosMovilidad(nom_area_estudios)
select distinct a.nombre_area_estudios_mov
from acuerdosMovilidad a

insert into pais(nom_pais)
select distinct a.pais_universidad_acuerdo
from acuerdosMovilidad a

insert into universidadMovilidad(nom_universidad, id_pais)
select distinct a.universidad_acuerdo, p.id_pais
from acuerdosMovilidad a, pais p
where p.nom_pais = a.pais_universidad_acuerdo

insert into tieneConvenioMovilidad(nom_centro, id_universidad, id_area_estudios, plazas_asignadas, plazasofertadas, in_out, anyo, programa, id_idioma)
select distinct (c.nom_centro), u.id_universidad, a.id_area_estudios, ac.plazas_asignadas_alumnos_out, ac.plazas_ofertadas_alumnos, ac.in_out::in_Out, ac.curso_academico, ac.nombre_programa_movilidad::program, i.id_idioma
from acuerdosMovilidad ac, areaEstudiosMovilidad a, centro c, universidadMovilidad u, idioma i
where c.nom_centro = ac.centro and ac.universidad_acuerdo = u.nom_universidad and a.nom_area_estudios = ac.nombre_area_estudios_mov and ac.nombre_idioma_nivel_movilidad = i.nom_idioma

