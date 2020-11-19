# Docker
This repo is a collection of container resources used to manage my homelab.

<h1>Bitcoin</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 - ruimarinho/bitcoin-core
    - Full Bitcoin node.
 - rahmnathan/electrum-personal-server
    - For communication from electrum client to our private node.
 - rahmnathan/airvpn
    - Routes all bitcoin-core network traffic through VPN service for anonymity

<h1>ddns</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 - oznu/cloudflare-ddns
    - Updates cloudflare DNS IPs on a schedule.
    
<h1>Deluge</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 - rahmnathan/airvpn:1.1.0.1
    - Routes all network traffic through VPN for anonymity.
 - rahmnathan/deluge
    - Deluge torrent server.
 - linuxserver/sonarr
    - Sonarr for TV series monitoring (monitor, download, move)
 - linuxserver/jackett
    - Indexing server for Sonarr.
    - Facilitates searching for torrents from wide range of indexers.
 - nginx:alpine
    - Facilitates communication into the Docker network to access Sonarr, Jackett, and Deluge.
    
<h1>OpenVPN</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 - shenxn/protonmail-bridge
    - Bridge for connecting generic desktop clients (Evolution) to ProtonMail servers.
    
<h1>Email</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 - shenxn/protonmail-bridge
    - Bridge for connecting generic desktop clients (Evolution) to ProtonMail servers.
    
<h1>OpenVPN</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 -  kylemanna/openvpn
    - Runs an OpenVPN server allowing me to remotely access my home network.
    
<h1>Tor</h1>
<h4>Deployment Type</h4>

docker-compose

<h4>Containers</h4>
 -  thetorproject/obfs4-bridge
    - Runs a Tor Bridge to allow users to safely and anonymously browse the internet.