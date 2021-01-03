#!/bin/bash
DATA_DIR=/data

REGION_DIR=$DATA_DIR/dati-regioni
# PROVINCE_DIR=$DATA_DIR/dati-province
NAZIONE_DIR=$DATA_DIR/dati-andamento-nazionale

# update data
docker exec -it django-covid git -C /data pull

# push data to database
docker exec -it django-covid-db psql -U covid-write -d covid -c "\COPY dashboard_regione(data,stato,codice_regione,denominazione_regione,lat,long,ricoverati_con_sintomi,terapia_intensiva,totale_ospedalizzati,isolamento_domiciliare,totale_positivi,variazione_totale_positivi,nuovi_positivi,dimessi_guariti,deceduti,casi_da_sospetto_diagnostico,casi_da_screening,totale_casi,tamponi,casi_testati,note,ingressi_terapia_intensiva,note_test,note_casi) FROM '$REGION_DIR/dpc-covid19-ita-regioni.csv' DELIMITER ',' CSV HEADER;"
docker exec -it django-covid-db psql -U covid-write -d covid -c "\COPY dashboard_nazione(data,stato,ricoverati_con_sintomi,terapia_intensiva,totale_ospedalizzati,isolamento_domiciliare,totale_positivi,variazione_totale_positivi,nuovi_positivi,dimessi_guariti,deceduti,casi_da_sospetto_diagnostico,casi_da_screening,totale_casi,tamponi,casi_testati,note,ingressi_terapia_intensiva,note_test,note_casi) FROM '$NAZIONE_DIR/dpc-covid19-ita-andamento-nazionale.csv' DELIMITER ',' CSV HEADER;"
