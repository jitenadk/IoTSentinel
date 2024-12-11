from src.module1 import scan_network
# import src.module1 

def test_scan_network():
    devices = scan_network('127.0.0.1/32')
    assert isinstance(devices, list)
