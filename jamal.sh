#!/bin/bash
# Proxy For Edukasi & Imclass
# Proxy For Telkomsel Opok
# ==============================
clear
echo Installing Websocket-SSH Python
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd
cd /usr/local/bin/
wget -O /usr/local/bin/ws-udin https://raw.githubusercontent.com/ADITYAH2/halucok/main/edu/ws-udin
chmod +x /usr/local/bin/ws-udin

# Installing Service
cat > /etc/systemd/system/ws-udin.service << END
[Unit]
Description=Python Edu Proxy By Geo Gabut
Documentation=https://geoganteng.tech
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-udin
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
#Enable & Start & Restart ws-udin service
systemctl enable ws-udin.service
systemctl restart ws-udin.service
