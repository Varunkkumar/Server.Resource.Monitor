# Server Resource Monitor

Two distinct Linux monitoring solutions (both Bash scripts):

1. **Live Terminal Monitor** (`Resource-Manager(liveterminalfeed).sh`)
   - Real-time display in terminal
   - Continuous updates (every 5 seconds)
   - No email functionality

2. **Email Reporter** (`Resource-Manager.sh`) 
   - Single snapshot of system status
   - Sends report via email (requires mail server setup)
   - Fallback to console output if email fails

## Key Differences

| Feature                | Live Terminal Version | Email Version |
|------------------------|----------------------|--------------|
| Output Method          | Terminal             | Email + Console |
| Update Frequency       | Continuous (5s)      | One-time      |
| Email Capability       | No                   | Yes          |
| Dependencies           | Core Linux utils     | mailutils + SMTP |

## Live Terminal Version

### Dependencies
- `top` - process monitoring
- `free` - memory stats
- `df` - disk usage
- `ip` - network stats
- `sleep` - refresh interval

### Usage
```bash

chmod +x Resource-Manager(liveterminalfeed).sh


./Resource-Manager(liveterminalfeed).sh


./Resource-Manager(liveterminalfeed).sh --once
```

## Email Version 

### Dependencies
Install required packages:
```bash
sudo apt update

sudo apt install mailutils ssmtp

sudo apt install mailutils postfix
```

Required components:
- `mailutils` package (for mail command)
- SMTP server access (choose one):
  - `ssmtp` (for external SMTP)
  - `postfix` (for local mail server)
  - Existing corporate mail server

SMTP Configuration:
Edit `/etc/ssmtp/ssmtp.conf` with your server details:
```bash
root=your@email.com
mailhub=smtp.yourprovider.com:587
AuthUser=your@email.com
AuthPass=yourpassword
UseSTARTTLS=YES
```

### Configuration
1. Edit `Resource-Manager.sh`:
   ```bash
   # Set your email
   EMAIL="Varunkausal2004@gmail.com"
   
   # Configure your SMTP server in /etc/ssmtp/ssmtp.conf
   ```

2. Make executable and run:
   ```bash
   chmod +x Resource-Manager.sh
   ./Resource-Manager.sh
   ```

## License
MIT License - free for personal and commercial use
