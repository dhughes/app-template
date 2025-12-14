# APP_NAME

APP_DESCRIPTION

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

Access at: http://localhost:APP_PORT

## First-Time Installation on Server

SSH to the server and run these commands:

```bash
# Clone the repository
cd ~/apps
git clone <repo-url> APP_SLUG
cd APP_SLUG

# Create virtual environment and install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Install systemd service
sudo ln -s /home/dhughes/apps/APP_SLUG/APP_SLUG.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable APP_SLUG
sudo systemctl start APP_SLUG

# Deploy infrastructure to update Caddy configuration
cd ~/infrastructure
sudo ./deploy.sh
```

Check that everything is running:

```bash
systemctl status APP_SLUG
journalctl -u APP_SLUG -f
```

## Deployment

After initial installation, deploy updates from your local machine:

```bash
./deploy-to-prod.sh
```

This will push changes to git, SSH to the server, pull updates, install dependencies, and restart the service.

## Port

This app runs on port APP_PORT.
