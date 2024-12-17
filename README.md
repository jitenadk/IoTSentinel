# IoTSentinel: IoT Security Vulnerability Scanner

IoTSentinel is a powerful tool designed to scan IoT networks for vulnerabilities. It identifies weak credentials, open ports, unpatched firmware, and other security misconfigurations, empowering administrators to secure their IoT environments effectively.

---

## **Features**

- Scan IoT devices on the network for:
  - IP and MAC addresses
  - Open ports
  - Device type and manufacturer
- Detect common vulnerabilities, including weak credentials and insecure protocols.
- Generate detailed reports of vulnerabilities and remediation suggestions.
- User-friendly web interface with real-time scanning updates.

---

## **Installation and Setup**

### **1. Prerequisites**

Before starting, ensure you have the following installed on your system:

- **Python 3.7+**
- **pip** (Python package manager)
- A Linux or macOS environment (or WSL for Windows).

### **2. Clone the Repository**

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/IoTSentinel.git
cd IoTSentinel
```

3. Set Up the Virtual Environment
Create and activate a virtual environment to isolate dependencies:

```bash
Copy code
python3 -m venv venv
source venv/bin/activate  # On Linux/macOS
```
For Windows:

```bash
Copy code
venv\Scripts\activate
```

4. Install Dependencies
Install the required Python libraries listed in requirements.txt:

```bash
Copy code
pip install -r requirements.txt
```

Usage
1. Running the Scanner
To start the network scanner and detect IoT devices:

```bash
Copy code
python src/scanner.py
```

2. Running the Flask Web Interface
To launch the web interface:

```bash
Copy code
python src/server.py
```
Open your browser and navigate to http://localhost:5000.

3. Generate Reports
Reports can be generated directly from the web interface after completing a scan.

Project Structure
The project is organized as follows:

```php
Copy code
IoTSentinel/
│
├── src/
│   ├── __init__.py        # Package initializer
│   ├── scanner.py         # Network scanning and vulnerability detection
│   ├── server.py          # Flask web server
│
├── templates/             # HTML templates for the web interface
│   ├── index.html         # Home page
│
├── static/                # Static assets (CSS, JS, etc.)
│
├── requirements.txt       # List of Python dependencies
└── README.md              # Project documentation
```
Development Roadmap
Completed:
Basic Flask app with homepage
Network scanning for IP and MAC addresses
Next Steps:
Integrate advanced vulnerability checks.
Build a detailed dashboard with sorting/filtering options.
Add database integration for storing device data and vulnerabilities.
Contributing
Contributions are welcome! If you'd like to contribute, follow these steps:

Fork the repository.
Create a new branch for your feature/bugfix.
Submit a pull request with a detailed description of your changes.
License
This project is licensed under the MIT License. See LICENSE for details.

Contact
For questions or feedback, please reach out to:

Email: yourname@example.com
GitHub: jitenadk


