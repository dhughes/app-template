# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Creating a New App from This Template

When the user asks you to create a new app from this template, follow these steps:

1. **Ask the user for the following information:**
   - App name (display name, e.g., "My Cool App")
   - App slug (URL-safe name, e.g., "my-cool-app")
   - App description (short description for the app card)
   - App icon (emoji, e.g., "🚀")
   - Port number (find the next available port by checking existing apps)
   - Whether the app should be public or private (add/remove forward_auth in caddy.conf)

2. **Copy this template to a new directory:**
   ```bash
   cp -r /Users/doughughes/Projects/Personal/app-template /Users/doughughes/Projects/Personal/APP_SLUG
   ```

3. **Replace all placeholders in the new directory:**
   - `APP_NAME` → actual display name
   - `APP_SLUG` → URL-safe slug
   - `APP_DESCRIPTION` → description
   - `APP_ICON` → emoji icon
   - `APP_PORT` → port number (e.g., 8005, 8006, etc.)
   - Rename `app-slug.service` to `APP_SLUG.service`

4. **Make deployment scripts executable:**
   ```bash
   chmod +x deploy.sh deploy-to-prod.sh
   ```

5. **Initialize git repository:**
   ```bash
   cd /Users/doughughes/Projects/Personal/APP_SLUG
   git init
   git add .
   git commit -m "Initial scaffold for APP_NAME"
   ```

6. **Create CLAUDE.md for the new app** with project-specific context.

## Template Files Reference

All files in this template contain placeholders that need to be replaced:

- `app.json` - App metadata for the index page
- `caddy.conf` - Reverse proxy configuration (includes forward_auth for private apps by default)
- `app.py` - Basic Flask application
- `templates/index.html` - Basic HTML template
- `requirements.txt` - Python dependencies
- `app-slug.service` - Systemd service file (MUST be renamed)
- `deploy.sh` - Server-side deployment script
- `deploy-to-prod.sh` - Local deployment trigger script
- `README.md` - Documentation
- `.gitignore` - Git ignore patterns

## Placeholders to Replace

- `APP_NAME` - Display name (e.g., "Color The Map")
- `APP_SLUG` - URL slug (e.g., "color-the-map")
- `APP_DESCRIPTION` - Short description
- `APP_ICON` - Emoji icon
- `APP_PORT` - Port number (default: 7999 for template, actual apps use 8001+)

## Important Notes

- Port 7999 is for the template itself (if testing)
- Port 8000 is reserved for the auth service
- Actual apps should use ports 8001, 8002, 8003, etc.
- Check existing apps to find the next available port
- Private apps need `forward_auth` in caddy.conf (included by default)
- Public apps should remove the `forward_auth` block from caddy.conf
