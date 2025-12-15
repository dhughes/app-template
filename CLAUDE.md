# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Creating a New App from This Template

When the user asks you to create a new app from this template, follow these steps:

1. **Ask the user for the following information:**
   - App name (display name, e.g., "My Cool App")
   - App slug (URL-safe name, e.g., "my-cool-app")
   - App description (short description for the app card)
   - App icon (emoji, e.g., "🚀")
   - Port number (find the next available port by checking existing apps in /Users/doughughes/Projects/Personal/*/caddy.conf)
   - Whether the app should be public or private (add/remove forward_auth in caddy.conf)

2. **Copy this template to a new directory:**
   ```bash
   cp -r /Users/doughughes/Projects/Personal/app-template /Users/doughughes/Projects/Personal/NEW_SLUG
   ```

3. **Replace all instances in the new directory:**
   - "App Template" → actual display name (in app.json, *.service, deploy scripts, README.md, CLAUDE.md, index.html, app.py)
   - "app-template" → URL-safe slug (in caddy.conf, *.service, deploy scripts, README.md, CLAUDE.md)
   - "📱" → emoji icon (in app.json, index.html)
   - "Template for creating new home server applications" → description (in app.json, README.md)
   - "7999" → port number (in caddy.conf, app.py, index.html, README.md)
   - Rename `app-template.service` to `NEW_SLUG.service`

4. **Update caddy.conf for public vs private:**
   - Private apps (default): keep `forward_auth` block
   - Public apps: remove the `forward_auth` block

5. **Scripts are already executable** (permissions are preserved during copy)

6. **Initialize git repository:**
   ```bash
   cd /Users/doughughes/Projects/Personal/NEW_SLUG
   git init
   git add .
   git commit -m "Initial scaffold for NEW_NAME"
   ```

7. **Create CLAUDE.md for the new app** with project-specific context.

## Template Files Reference

All files in this template use "App Template", "app-template", "📱", "7999", etc. that need to be replaced:

- `app.json` - App metadata for the index page
- `caddy.conf` - Reverse proxy configuration (includes forward_auth for private apps by default)
- `app.py` - Basic Flask application
- `templates/index.html` - Basic HTML template
- `requirements.txt` - Python dependencies
- `app-template.service` - Systemd service file (MUST be renamed to NEW_SLUG.service)
- `deploy.sh` - Server-side deployment script
- `deploy-to-prod.sh` - Local deployment trigger script
- `README.md` - Documentation
- `CLAUDE.md` - Project context for Claude
- `.gitignore` - Git ignore patterns

## Values to Replace

- "App Template" → Display name (e.g., "Color The Map")
- "app-template" → URL slug (e.g., "color-the-map")
- "Template for creating new home server applications" → Short description
- "📱" → Emoji icon
- "7999" → Port number (actual apps use 8001, 8002, 8003, etc.)

## Important Notes

- Port 7999 is for the template itself (if testing)
- Port 8000 is reserved for the auth service
- Actual apps should use ports 8001, 8002, 8003, etc.
- Check existing apps to find the next available port
- Private apps need `forward_auth` in caddy.conf (included by default)
- Public apps should remove the `forward_auth` block from caddy.conf
