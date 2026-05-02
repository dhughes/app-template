#!/bin/bash
set -e

echo "🚀 Deploying App Template..."

# Pull latest changes
echo "📥 Pulling latest changes..."
git pull

# Activate virtual environment and update dependencies
echo "📦 Updating dependencies..."
source venv/bin/activate
pip install -r requirements.txt

echo "🔧 Updating Caddy configuration..."
sudo /mnt/data/infrastructure/deploy.sh caddy

# Restart service
echo "📋 Updating systemd unit..."
sudo cp app-template.service /etc/systemd/system/app-template.service
sudo chmod 644 /etc/systemd/system/app-template.service
sudo systemctl daemon-reload
echo "🔄 Restarting service..."
sudo systemctl restart app-template

# Show status
echo "✅ Deployment complete!"
echo "📊 Service status:"
systemctl status app-template
