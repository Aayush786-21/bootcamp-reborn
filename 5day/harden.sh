#!/bin/bash

REPORT="/var/log/harden-report.txt"
NEW_PORT=2222

echo "==== Server Hardening Report ====" > $REPORT
echo "Timestamp: $(date)" >> $REPORT
echo "" >> $REPORT

# 1. Disable root SSH login
sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
echo "[OK] Disabled root SSH login" >> $REPORT

# 2. Change SSH port
if ! grep -q "Port $NEW_PORT" /etc/ssh/sshd_config; then
    sed -i "s/^#Port 22/Port $NEW_PORT/" /etc/ssh/sshd_config
    sed -i "s/^Port 22/Port $NEW_PORT/" /etc/ssh/sshd_config
    echo "[OK] SSH port changed to $NEW_PORT" >> $REPORT
fi

# Restart SSH safely
systemctl restart sshd

# 3. Install and configure Fail2Ban
apt update -y
apt install fail2ban -y

systemctl enable fail2ban
systemctl start fail2ban
echo "[OK] Fail2Ban installed and enabled" >> $REPORT

# 4. Disable unused services (example)
systemctl disable avahi-daemon --now 2>/dev/null
systemctl disable cups --now 2>/dev/null
echo "[OK] Disabled unnecessary services" >> $REPORT

# 5. Firewall Setup (UFW)
apt install ufw -y

ufw default deny incoming
ufw default allow outgoing
ufw allow $NEW_PORT/tcp   # Allow new SSH port
ufw allow 80/tcp          # Allow HTTP
ufw allow 443/tcp         # Allow HTTPS
ufw --force enable

echo "[OK] UFW firewall enabled" >> $REPORT

echo "" >> $REPORT
echo "==== Final Status ====" >> $REPORT
ufw status >> $REPORT
echo "" >> $REPORT

echo "[DONE] Security hardening complete!"
echo "Report saved to: $REPORT"

