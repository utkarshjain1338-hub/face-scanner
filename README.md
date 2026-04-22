# 🛡️ Face Scanner: Facial Authentication for Linux

![Face Scanner Logo](logo.png)

**Face Scanner** is a streamlined solution for bringing biometric facial authentication (Windows Hello style) to Linux systems. It simplifies the installation of **Howdy** and provides a custom, Python-based PAM interface for improved reliability and features on Debian-based distributions like **Parrot OS**.

---

## 🚀 Features

- **Automated Installation**: One-click script to install Howdy and all its dependencies.
- **Smart Workarounds**: Includes fixes for common package mirror issues (like `libtiff` 404s).
- **Custom PAM Interface**:
  - 🔒 **SSH Detection**: Automatically disables facial auth for remote SSH sessions.
  - 💻 **Lid Detection**: Prevents accidental triggers when the laptop lid is closed.
  - 🌑 **Dark Mode Support**: Alerts user if the environment is too dark for detection.
  - 📝 **Detailed Logging**: Integrated with `syslog` for easy debugging.
- **Hardware Optimized**: Specifically tuned for IR cameras on laptops like the **Dell Latitude 5400**.

---

## 📥 Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/face-scanner.git
   cd face-scanner
   ```

2. **Run the installer**:
   ```bash
   chmod +x install_howdy.sh
   sudo ./install_howdy.sh
   ```
   *Note: Choose the **'Balanced'** model when prompted for the best performance.*

---

## ⚙️ Configuration

After installation, follow these steps to set up your face profile:

### 1. Identify your Camera
Find your IR camera device path (usually `/dev/video0`, `/dev/video1`, or `/dev/video2`):
```bash
ls /dev/video*
```

### 2. Update Howdy Config
Open the config file and update the `device_path`:
```bash
sudo howdy config
```
Look for:
```ini
# The path to the camera to use
device_path = /dev/video2
```

### 3. Register your Face
Add your face model (it's recommended to do this in different lighting conditions):
```bash
sudo howdy add
```

---

## 🧪 Testing

Verify the setup by running:
```bash
sudo howdy test
```
This will open a window showing the camera feed and how the algorithm is detecting your face.

---

## 🛠️ Advanced: PAM Fix
The included `pam_fixed.py` can be used to replace or enhance the default Howdy PAM module. It provides better error handling and security checks (like disabling auth when the lid is closed).

To use it, ensure it's placed in your Howdy installation directory (usually `/lib/security/howdy/`) and configured in your `/etc/pam.d/` files.

---

## 🤝 Contributing
Contributions are welcome! Feel free to open issues or submit pull requests.

---

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Built with ❤️ for the Linux Community.*
