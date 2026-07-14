from django.db import models

class conred(models.Model):
    index = models.AutoField(primary_key=True)
    codigo = models.BigIntegerField(null=False)
    departamento = models.TextField(null=False)
    cod_municipio = models.BigIntegerField(null=False)
    municipio = models.TextField(null=False)
    eventos_naturales = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    degradacion_ambiental = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    inform_humano = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    inform_natural = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    peligro_y_exposicion = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    desarrollo_economico = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    desigualdad = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    desarrollo_y_pobreza = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    poblacion_en_dependencia = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    poblacion_desprotegida = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    socioeconomica = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    grupos_vulnerables = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    vulnerabilidades = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    rrd = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    gestion_municipal = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    comunicacion = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    infraestructura = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    salud = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    inform_institucional = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    inform_infraestrucutra = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    falta_capacidad_respuesta = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    inform_risk = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    ranking = models.BigIntegerField(null=False)
    ranking_dep = models.BigIntegerField(null=True)
    missing_indicators = models.BigIntegerField(null=False)
    missing_data_p = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    def __str__(self):
        return " %s, %s, %s" % (self.departamento, self.municipio, str(self.ranking))


class riesgo(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.TextField(null=False)
    min_ri = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    max_ri = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    color_ri = models.TextField(null=True)

    min_pelyexp = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    max_pelyexp = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    color_pelyexp = models.TextField(null=True)

    min_vul = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    max_vul = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    color_vul = models.TextField(null=True)

    min_capres = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    max_capres = models.DecimalField(max_digits=10, decimal_places=4, default=float(0.00))
    color_capres = models.TextField(null=True)

    def __str__(self):
        return "%s" % (self.name)



class nivel(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.TextField(null=False)

    def __str__(self):
        return "%s" % (self.name)


class indicador(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.TextField(null=False)
    name_db = models.TextField(null=False)
    nivel=models.ForeignKey(nivel, on_delete=models.CASCADE, blank=True, null=True, default=0)

    def __str__(self):
        return "%s" % (self.name)