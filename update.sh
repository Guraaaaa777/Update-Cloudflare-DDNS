Domain=""

ZONE_ID=""
RECORD_ID=""
AUTH_EMAIL=""
API_TOKEN=""

Global_IP_Address=""

IP_Address_Services=(
    "https://api.ipify.org/"
    "https://ipinfo.io/ip"
    "https://ipecho.net/plain"
)
patern="^([0-9]{1,3}\.){3}[0-9]{1,3}$"
for service in ${IP_Address_Services[@]}
do
Global_IP_Address=$(curl -s "$service")
if [[ $Global_IP_Address = $patern ]]; then
break
fi
done

echo $Global_IP_Address

