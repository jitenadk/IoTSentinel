import nmap
from scapy.all import ARP, Ether, srp

def scan_network(ip_range):
    """Scans the network for active devices."""
    print(f"Scanning network: {ip_range}")
    nm = nmap.PortScanner()
    nm.scan(ip_range, arguments='-sn')
    devices = []
    for host in nm.all_hosts():
        devices.append({
            'ip': host,
            'mac': nm[host]['addresses'].get('mac', 'N/A')
        })
    return devices

def check_vulnerabilities(device):
    """Checks a device for common vulnerabilities."""
    
    vulnerabilities = []
    if device.get('mac') == 'N/A':
        vulnerabilities.append('MAC address not detected')
    # Add more vulnerability checks as needed
    return vulnerabilities
