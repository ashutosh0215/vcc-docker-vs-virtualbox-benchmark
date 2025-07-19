# Virtualization Showdown: Docker Containers vs VirtualBox VMs

## Project Summary

This project conducts a comparative performance analysis between Docker containers and VirtualBox virtual machines on the same host system. The benchmarks used cover:

- Fibonacci Execution (CPU-bound load)
- Resource Elasticity Test (monitoring CPU/RAM usage under dynamic load)
- ML API Benchmark using Flask + scikit-learn, served via Gunicorn and load-tested using ApacheBench

Each test evaluates execution time, resource utilization, and system responsiveness under identical conditions to identify virtualization overheads and performance trade-offs.

## How to Run the Benchmarks

### 1. Setup (Applies to both Docker and VirtualBox)

- Ensure Python 3.10+ is installed.
- Install the following Python packages:
  - scikit-learn
  - flask
  - gunicorn
  - psutil
- Clone the repository:
  ```bash
  git clone https://github.com/ashutosh0215/vcc-docker-vs-virtualbox-benchmark
  cd vcc-docker-vs-virtualbox-benchmark
  ```
- (For VirtualBox) Use shared folders or SCP to transfer files into the VM.

## Docker Instructions

### Build Docker Image
```bash
docker build -t vcc-benchmark:ml .
```

### Run Fibonacci Benchmark
```bash
docker run -it vcc-benchmark:ml /usr/bin/time -v python3 benchmark.py
```

### Run Resource Elasticity Test
```bash
docker run -it vcc-benchmark:ml /usr/bin/time -v python3 elasticity_test.py
```

### Run ML API Server
```bash
docker run -it -p 5000:5000 vcc-benchmark:ml gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### Load Test the API
```bash
ab -n 1000 -c 10 -p sample.json -T application/json http://localhost:5000/predict
```

## VirtualBox VM Instructions

### Run Fibonacci Benchmark
```bash
/usr/bin/time -v python3 benchmark.py
```

### Run Resource Elasticity Test
```bash
/usr/bin/time -v python3 elasticity_test.py
```

### Start ML API Server
```bash
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### Load Test the API (from a second terminal)
```bash
ab -n 1000 -c 10 -p sample.json -T application/json http://localhost:5000/predict
```
