from setuptools import setup, find_packages

setup(
    name='IoTSentinel',
    version='1.0',
    description='IoT Security Vulnerability Scanner',
    author='Your Name',
    packages=find_packages(),
    install_requires=[
        'Flask',
        'python-nmap',
        'scapy'
    ],
    entry_points={
        'console_scripts': [
            'IoTSentinel=src.main:main'
        ]
    },
)
