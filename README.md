![CKPool-DigiByte Stack](assets/ckpool-dgb-ckstats.jpg)

# CKPool‑DigiByte: Solo Mining Stack  
A fully integrated, deterministic solo‑mining stack for DigiByte (DGB), combining:

- CKPool‑DGB — optimized CKPool fork for DigiByte  
- DigiByte Core — full node providing consensus, mempool, and block validation  
- CKStats — modern Next.js dashboard for real‑time pool monitoring  
- Systemd services — production‑grade orchestration  
- Artifact‑free configs — clean, reproducible, deterministic setup  

This repository provides everything required to run a self‑hosted, autonomous DigiByte solo‑mining pool.

---

## 🚀 Features

### CKPool‑DGB
- Lightweight, high‑performance solo mining pool  
- Supports ASICs, FPGAs, and CPU/GPU miners  
- Custom DGB‑specific patches  
- Clean configuration (ckpool-dgb.conf)  
- Built‑in stratum server  
- Coinbase tag support via `btcsig`  

### DigiByte Core
- Full DigiByte node  
- Provides block templates to CKPool  
- Validates mined blocks  
- Exposes RPC for pool operations  
- Clean, unbuilt source included for reproducibility  

### CKStats Dashboard
- Next.js + Tailwind + TypeORM  
- Real‑time miner stats  
- Worker performance  
- Pool health  
- Block submissions  
- PostgreSQL backend  
- Clean `.env.example` included  

### Systemd Integration
- ckpool.service  
- digibyted.service  
- ckstats.service  
- Automatic restart  
- Log rotation ready  

---

## 🔧 Build Instructions

### CKPool‑DGB
cd ckpool-source  
./autogen.sh  
./configure  
make -j$(nproc)

### DigiByte Core
cd digibyte  
./autogen.sh  
./configure --without-gui  
make -j$(nproc)  
sudo make install

### DigiByte Core Configuration Note (Important)
DigiByte rotates algorithms every block.  
CKPool requires **SHA256d only**.

Edit your DigiByte config:

nano ~/Ckpool-Digibyte/configs/digibyte.conf

Add:

algo=sha256d

This forces DigiByte Core to always return SHA256d block templates for CKPool‑DGB.

### CKStats Dashboard
cd ckstats  
cp .env.example .env  
pnpm install  
pnpm build  
pnpm start

---

## ⚙️ Systemd Setup (Manual Creation) for auto seed, update user and cleanup

### Create DigiByte Core service
sudo nano /etc/systemd/system/digibyted.service

[Unit]  
Description=DigiByte Daemon  
After=network.target

[Service]  
ExecStart=/usr/local/bin/digibyted -conf=/home/umbrel/ckpool-dgb-github/configs/digibyte.conf  
User=umbrel  
Restart=always  
TimeoutStopSec=90

[Install]  
WantedBy=multi-user.target


### Create CKPool‑DGB service
sudo nano /etc/systemd/system/ckpool.service

[Unit]  
Description=CKPool-DGB Solo Pool  
After=network.target digibyted.service

[Service]  
ExecStart=/home/umbrel/ckpool-dgb-github/ckpool-source/ckpool-dgb -c /home/umbrel/ckpool-dgb-github/configs/ckpool-dgb.conf  
User=umbrel  
Restart=always

[Install]  
WantedBy=multi-user.target


### Create CKStats Dashboard service
sudo nano /etc/systemd/system/ckstats.service

[Unit]  
Description=CKStats Dashboard  
After=network.target postgresql.service

[Service]  
WorkingDirectory=/home/umbrel/ckpool-dgb-github/ckstats  
ExecStart=/usr/bin/pnpm start  
User=umbrel  
Restart=always  
Environment=NODE_ENV=production

[Install]  
WantedBy=multi-user.target


### Enable and start all services
sudo systemctl daemon-reload  
sudo systemctl enable digibyted ckpool ckstats  
sudo systemctl start digibyted ckpool ckstats

---

## 🧪 Testing the Pool

### Check CKPool:
telnet localhost 3334

### Check DigiByte RPC:
digibyte-cli getblockchaininfo

### Check CKStats:
Open browser:  
http://<your-ip>:3003

---

## 🛡️ Security Notes
- Never expose CKPool or DigiByte RPC to the public internet  
- Use firewall rules to restrict access  
- Keep `.env` files private  
- Only `.env.example` is committed  

---

## 📜 License
- CKPool‑DGB: GPLv2  
- DigiByte Core: MIT  
- CKStats: MIT  

---

## 🤝 Contributing
Pull requests are welcome.  
For major changes, open an issue first to discuss what you’d like to modify.

---

## ⭐ Acknowledgements
- Con Kolivas (CKPool)  
- Z3r0XG (lhr)
- DigiByte Core developers  
- Community contributors  
