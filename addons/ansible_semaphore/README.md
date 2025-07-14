# Ansible Semaphore - Home Assistant Add-on

[![License][license-shield]](LICENSE.md)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

[<img src="https://raw.githubusercontent.com/m4dmin/hassio-addons/refs/heads/main/images/donate-paypal.svg" width=200/>](https://www.paypal.com/donate/?hosted_button_id=D7LSBKRSMHCTW)

[![Ansible Semaphore](https://img.shields.io/badge/addon-ansible--semaphore-blue)](https://github.com/m4dmin/hassio-addons/tree/main/addons/ansible_semaphore)

This Home Assistant add-on provides a fully integrated instance of [Ansible Semaphore](https://ansible-semaphore.com/), a modern web-based interface for running Ansible playbooks.

### 📢 Project Status

> ⚠️ **This Home Assistant add-on is currently under development.**  
> Use with caution in production environments and feel free to provide feedback or contribute.

---

## 🧩 Features

- Full-featured [Ansible Semaphore](https://github.com/ansible-semaphore/semaphore)
- Integrated via Home Assistant Ingress (no extra ports needed)
- Persistent storage using `/data/` volume
- Simple setup with environment variables
- Supports amd64 and aarch64 architectures

---

## 🚧 Known Limitation: Ingress Not Supported

Currently, **Home Assistant Ingress is not supported** due to technical limitations in the Semaphore web interface (it uses absolute paths that are incompatible with Ingress URLs).

To use Semaphore inside Home Assistant, you can:

1. Disable ingress in the add-on configuration.
2. Expose port `3100`.
3. Integrate the UI manually into the Home Assistant sidebar using an IFrame panel.

---

## 🚀 Getting Started

1. Go to **Settings → Add-ons → Add-on Store**.
2. Add this repository (if using a custom one).
3. Install the **Ansible Semaphore** add-on.
4. Configure admin credentials in the **add-on settings**.
5. Start the add-on and open the UI via Ingress.

---

## ⚙️ Configuration Options

You can set the following environment variables in the add-on configuration:

| Option                   | Description               | Default         |
|--------------------------|---------------------------|-----------------|
| `SEMAPHORE_ADMIN`        | Admin username            | `admin`         |
| `SEMAPHORE_ADMIN_PASSWORD` | Admin password         | `changeme`      |
| `SEMAPHORE_ADMIN_NAME`   | Display name              | `HA-Admin`      |
| `SEMAPHORE_ADMIN_EMAIL`  | Admin email address       | `admin@example.com` |

All data and configuration files are stored in `/data`, which is persisted across reboots and updates.

---

## 🛠 Data Storage

- The BoltDB database is stored in: `/data/semaphore.db`
- The generated configuration file is stored in: `/data/config.json`

These files are automatically created on the first startup, if not present.

---

## 🧪 Development Notes

- Base image: [`semaphoreui/semaphore`](https://hub.docker.com/r/semaphoreui/semaphore)
- If `config.json` is missing, it will be auto-generated with secure defaults
- Uses `semaphore server --config /data/config.json` to launch

---

## 📚 More Information

- Project website: [https://ansible-semaphore.com](https://ansible-semaphore.com)
- Source code: [https://github.com/ansible-semaphore/semaphore](https://github.com/ansible-semaphore/semaphore)

---

## 🧑‍💻 Maintainer

This add-on was created and is maintained by **m4dmin**.  
Pull requests and suggestions are welcome!

