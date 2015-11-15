# dumps all the data in the database into a file
# --no-create-info    only data is exported, not the "creates"
# --skip-opt          dumps in a readable format

mysqldump -h db.ist.utl.pt -u ist173294 -p ist173294 --no-create-info --skip-opt \
Actuator Connects Device Lives Municipality PAN Patient Period Reading Sensor Setting Wears \
> medical_centre_dump.sql

