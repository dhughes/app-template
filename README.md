# App Template

Template for creating new home server applications

## Development

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run locally
python app.py
```

Access at: http://localhost:7999

## First-Time Installation on Server

SSH to the server and run these commands:

```bash
# Clone the repository
cd ~/apps
git clone <repo-url> app-template
cd app-template

# Create virtual environment and install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Install systemd service
sudo ln -s /home/dhughes/apps/app-template/app-template.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable app-template
sudo systemctl start app-template

# Deploy infrastructure to update Caddy configuration
cd ~/infrastructure
sudo ./deploy.sh
```

Check that everything is running:

```bash
systemctl status app-template
journalctl -u app-template -f
```

## Deployment

After initial installation, deploy updates from your local machine:

```bash
./deploy-to-prod.sh
```

This will push changes to git, SSH to the server, pull updates, install dependencies, and restart the service.

## Port

This app runs on port 7999.
