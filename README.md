# HoneyGain Configuration for Raspberry Pi

This repository provides a simple script to easily run a HoneyGain Docker container on a Raspberry Pi for earning passive income through bandwidth sharing.

## Overview

HoneyGain is a service that allows you to earn money by sharing your unused internet bandwidth. This script automates the setup and deployment of the HoneyGain Docker container on your Raspberry Pi.

## Prerequisites

Before running this script, ensure you have:

- A Raspberry Pi with Raspberry Pi OS installed
- Docker installed on your Raspberry Pi
- A HoneyGain account (sign up at [honeygain.com](https://honeygain.com))
- Internet connection
- Sufficient bandwidth to share

## Docker Installation

If Docker is not installed on your Raspberry Pi, install it using:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
```

Log out and log back in for the group changes to take effect.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/honeygain-config-raspberry-pi.git
   cd honeygain-config-raspberry-pi
   ```

2. Make the script executable (if not already):
   ```bash
   chmod +x setup.sh
   ```

## Configuration

1. Copy the honeygain.env template and fill in your credentials:
   ```bash
   cp honeygain.env honeygain.env.local
   nano honeygain.env.local  # or use your preferred editor
   ```

2. Update the configuration file with your actual values:
   - `ACCOUNT_EMAIL`: Your HoneyGain account email address
   - `ACCOUNT_PASSWORD`: Your HoneyGain account password
   - `DEVICE_NAME`: A unique name for this device (e.g., "raspberry-pi-kitchen")

## Usage

Once you've configured your honeygain.env file, simply run:

```bash
./setup.sh
```

### Example honeygain.env file:

```bash
ACCOUNT_EMAIL=john@example.com
ACCOUNT_PASSWORD=mypassword
DEVICE_NAME=rpi-livingroom
```

## Running as a Service

To run HoneyGain continuously, you may want to set up a systemd service or use Docker's restart policies:

```bash
docker run -d --restart=unless-stopped --name honeygain honeygain/honeygain -tou-accept -email your@email.com -pass yourpassword -device your-device-name
```

## Security Considerations

- **Bandwidth Sharing**: This service shares your internet bandwidth with HoneyGain's network
- **Privacy**: Review HoneyGain's privacy policy and terms of service before use
- **Network Security**: Ensure your network is properly secured when sharing bandwidth
- **Credentials**: Keep your account credentials secure. The honeygain.env file contains sensitive information

## Monitoring

Monitor your earnings and device status through the HoneyGain dashboard at [dashboard.honeygain.com](https://dashboard.honeygain.com).

## Troubleshooting

### Common Issues

1. **Docker not found**: Ensure Docker is installed and the service is running
2. **Permission denied**: Make sure the script has executable permissions
3. **Container fails to start**: Check your credentials and internet connection
4. **Account locked**: Verify your HoneyGain account status

### Logs

To view container logs:
```bash
docker logs honeygain
```

## Disclaimer

**Important**: By using this script and running HoneyGain, you are sharing your internet bandwidth and may be responsible for the traffic that passes through your connection. Understand the risks and legal implications in your jurisdiction before proceeding.

This project is not officially affiliated with HoneyGain. Use at your own risk.

## License

This project is provided as-is under the MIT License. See LICENSE file for details.

## Contributing

Feel free to submit issues and pull requests to improve this setup script.