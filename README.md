# Update-Cloudflare-DDNS
1. generate api token on "dash.cloudflare.com/profile/api-tokens"
2. get your zone_id ↓
    curl https://api.cloudflare.com/client/v4/zones?name="$YOUR_DOMAIN_NAME" \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN"
    -H "Content-Type: application/json"
2. get your record_id ↓
    curl https://api.cloudflare.com/client/v4/zones/"$YOUR_ZONE_ID"/dns_records \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN"
3. input ZONE_ID,DNS_RECORD_ID,CLOUDFLARE_API_TOKEN in update.sh
4. add update.sh to cron, systemd-timer, etc...