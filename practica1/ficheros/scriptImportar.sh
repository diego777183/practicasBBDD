sudo su
#oferta y ocupacion de plazas
wget -O oferPlazas19.csv https://zaguan.unizar.es/record/87665/files/CSV.csv
wget -O oferPlazas18.csv https://zaguan.unizar.es/record/76878/files/CSV.csv
wget -O oferPlazas17.csv https://zaguan.unizar.es/record/70115/files/CSV.csv

#resultados titulaciones
wget -O resulTitu19.csv https://zaguan.unizar.es/record/95644/files/CSV.csv
wget -O resulTitu18.csv https://zaguan.unizar.es/record/76879/files/CSV.csv
wget -O resulTitu17.csv https://zaguan.unizar.es/record/70120/files/CSV.csv

#notas de corte
wget -O notasCorte19.csv https://zaguan.unizar.es/record/87663/files/CSV.csv
wget -O notasCorte18.csv https://zaguan.unizar.es/record/76876/files/CSV.csv
wget -O notasCorte17.csv https://zaguan.unizar.es/record/70105/files/CSV.csv

#acuerdos de movilidad
wget -O acuerdosMov19.csv https://zaguan.unizar.es/record/83980/files/CSV.csv
wget -O acuerdosMov18.csv https://zaguan.unizar.es/record/76880/files/CSV.csv
wget -O acuerdosMov17.csv https://zaguan.unizar.es/record/70140/files/CSV.csv

#alumnos egresados
wget -O alumnEgres19.csv https://zaguan.unizar.es/record/95646/files/CSV.csv
wget -O alumnEgres18.csv https://zaguan.unizar.es/record/83979/files/CSV.csv
wget -O alumnEgres17.csv https://zaguan.unizar.es/record/70130/files/CSV.csv
sudo cp alumnEgres* acuerdosMov* notasCorte* resulTitu* oferPlazas* /var/lib/mysql-files

