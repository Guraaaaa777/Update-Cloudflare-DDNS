ZONE_ID=""
DNS_RECORD_ID=""
CLOUDFLARE_API_TOKEN=""

Global_IP_Address=""
IP_Address_Services=(
    "https://api.ipify.org/"
    "https://ipinfo.io/ip"
    "https://ipecho.net/plain"
)
patern="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

for service in ${IP_Address_Services[@]}
do
Global_IP_Address=$(curl -s --connect-timeout 3 "$service")
if [[ $Global_IP_Address = $pattern ]]; then
break
fi
done

echo $Global_IP_Address

curl -X PATCH "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID" \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
    -d "{\"content\": \"$Global_IP_Address\"}"