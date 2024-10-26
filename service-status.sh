#!/bin/bash

temp_file='/tmp/service_status.txt'

{
	systemctl status kibana.service
	systemctl status elasticsearch.service
	systemctl status heartbeat-elastic.service
	systemctl status genesys.service
} > "$temp_file"

mail -s "Estado de los servicios core de $(hostname)" mdantesarco@dcs.ar < $temp_file

rm $temp_file