# VM vs Docker Performance Comparison

## Project Objective

This project compares the performance of a Python FastAPI application
running directly on a Virtual Machine and inside a Docker container.

## Environments

### Native VM
- Ubuntu 24.04
- FastAPI
- Uvicorn
- Port: 8000

### Docker
- Docker container
- FastAPI
- Uvicorn
- Port: 8001

## Tests Performed

### 1. Compute Test
Measures the response time of the `/compute` endpoint.

### 2. Memory Test
Measures the response time of the `/memory` endpoint.

### 3. Concurrent Request Test
Uses ApacheBench to send multiple requests simultaneously.

### 4. Resource Usage
Docker CPU and memory usage were measured using:

docker stats

System memory was checked using:

free -h

## Results

### Compute

| Environment | Average |
|-------------|---------|
| Native VM | 0.039293 s |
| Docker | 0.052390 s |

### Memory

| Environment | Average |
|-------------|---------|
| Native VM | 0.031218 s |
| Docker | 0.034857 s |

Both environments successfully processed the tested requests
without failures.

## Conclusion

The project demonstrates the performance differences between
running an application directly in a virtual machine and running
the same application inside a Docker container.

The experiment measures response time, concurrent request
performance, CPU usage and memory usage.
