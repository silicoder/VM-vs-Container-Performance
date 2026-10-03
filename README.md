# VM vs Docker Performance Comparison

## 1. Project Overview

This project compares the performance of a **FastAPI application running directly on an Ubuntu Virtual Machine (VM)** with the same application running inside a **Docker container**.

The experiment evaluates:

* Compute performance
* Memory performance
* Concurrent request handling
* Docker CPU and memory usage
* System memory usage
* Application networking

The purpose is to observe the performance differences between running an application directly inside a VM and running it inside a Docker container.

---

## 2. Project Objectives

The main objectives of this experiment are:

1. Compare application compute performance between a VM and Docker.
2. Compare memory-operation performance.
3. Test concurrent request handling.
4. Measure Docker container resource usage.
5. Observe system memory usage.
6. Compare the application networking configuration.
7. Understand the practical performance characteristics of containerized applications.

---

## 3. VM vs Container

### Virtual Machine

A Virtual Machine runs a complete operating system on virtualized hardware.

```text
Application
     ↓
Guest Operating System
     ↓
Virtual Hardware
     ↓
Hypervisor
     ↓
Host Operating System
     ↓
Physical Hardware
```

The VM used in this experiment runs Ubuntu 24.04.

### Docker Container

A Docker container runs the application while sharing the host operating-system kernel.

```text
Application
     ↓
Docker Container
     ↓
Host Operating System Kernel
     ↓
Physical Hardware
```

Containers do not require a separate guest operating system for each application.

---

# 4. Experimental Environment

## Native VM

| Parameter          | Configuration          |
| ------------------ | ---------------------- |
| Environment        | VMware Virtual Machine |
| Operating System   | Ubuntu 24.04           |
| Application        | FastAPI                |
| Application Server | Uvicorn                |
| Port               | 8000                   |

## Docker

| Parameter            | Configuration         |
| -------------------- | --------------------- |
| Container Technology | Docker                |
| Application          | FastAPI               |
| Application Server   | Uvicorn               |
| Port                 | 8001                  |
| Container Name       | `vm-vs-api-container` |

The same FastAPI application functionality was tested in both environments.

---

# 5. Technologies Used

* Ubuntu 24.04
* VMware
* Docker
* Dockerfile
* Python
* FastAPI
* Uvicorn
* ApacheBench
* Linux system monitoring tools
* Git
* GitHub

---

# 6. Application Architecture

The experiment uses two instances of the FastAPI application.

```text
                    VM Environment
                         │
                         ▼
                  FastAPI Application
                         │
                    Port 8000
                         │
                         ▼
                    Test Requests


                    Docker Environment
                         │
                         ▼
                  Docker Container
                         │
                  FastAPI Application
                         │
                    Port 8001
                         │
                         ▼
                    Test Requests
```

This allows the application performance to be compared between the two environments.

---

# 7. Tests Performed

The following tests were performed.

### 7.1 Compute Test

The `/compute` endpoint was tested to measure the time required to perform the compute workload.

Measured values:

* Average response time
* Minimum response time
* Maximum response time

### 7.2 Memory Test

The `/memory` endpoint was tested to measure memory-related processing time.

Measured values:

* Average response time
* Minimum response time
* Maximum response time

### 7.3 Concurrent Request Test

ApacheBench was used to send multiple requests concurrently.

Test configuration:

```text
Requests: 100
Concurrency: 10
```

The number of failed requests was recorded for both environments.

### 7.4 Docker Resource Usage

Docker resource consumption was monitored using:

```bash
docker stats
```

The following values were observed:

* CPU usage
* Memory usage

### 7.5 System Memory

System memory was checked using:

```bash
free -h
```

The following values were recorded:

* Total RAM
* Used RAM
* Free RAM
* Available RAM

---

# 8. Compute Performance

The compute benchmark measured the response time of the `/compute` endpoint.

### Results

| Environment |    Average |    Minimum |    Maximum |
| ----------- | ---------: | ---------: | ---------: |
| Native VM   | 0.039293 s | 0.035845 s | 0.053111 s |
| Docker      | 0.052390 s | 0.049004 s | 0.061435 s |

### Interpretation

The measured average response time was:

* **Native VM:** 0.039293 seconds
* **Docker:** 0.052390 seconds

The experiment therefore shows a measurable difference in compute response time for this particular workload.

---

# 9. Memory Performance

The memory benchmark measured the response time of the `/memory` endpoint.

### Results

| Environment |    Average |    Minimum |    Maximum |
| ----------- | ---------: | ---------: | ---------: |
| Native VM   | 0.031218 s | 0.028431 s | 0.041243 s |
| Docker      | 0.034857 s | 0.031907 s | 0.043938 s |

### Interpretation

The measured average response time was:

* **Native VM:** 0.031218 seconds
* **Docker:** 0.034857 seconds

The difference between the two environments was relatively small for this particular memory workload.

---

# 10. Concurrent Request Performance

ApacheBench was used to test concurrent requests.

### Test Configuration

```text
Total Requests: 100
Concurrency: 10
```

### Results

| Environment | Requests | Concurrency | Failed Requests |
| ----------- | -------: | ----------: | --------------: |
| Native VM   |      100 |          10 |               0 |
| Docker      |      100 |          10 |               0 |

Both environments successfully completed all tested requests without failures.

---

# 11. Docker Resource Usage

Docker resource usage was measured using:

```bash
docker stats --no-stream
```

### Observed Container Usage

| Resource       | Docker Container |
| -------------- | ---------------: |
| CPU Usage      |            0.24% |
| Memory Usage   |        111.9 MiB |
| Memory Limit   |        8.062 GiB |
| Memory Usage % |            1.36% |
| Network I/O    |  286 kB / 319 kB |
| Block I/O      |     0 B / 799 kB |
| Processes      |               11 |

These values represent the observed resource usage of the running FastAPI Docker container during the experiment.

---

# 12. System Memory

System memory was checked using:

```bash
free -h
```

### Observed Memory

| Memory Parameter |   Value |
| ---------------- | ------: |
| Total RAM        | 8.1 GiB |
| Used             | 1.7 GiB |
| Free             | 4.2 GiB |
| Available        | 6.3 GiB |
| Swap             | 4.0 GiB |
| Swap Used        |     0 B |

The system had approximately **6.3 GiB of available memory** during the recorded measurement.

---

# 13. Docker Networking

The FastAPI applications were exposed on separate ports.

| Environment | Port |
| ----------- | ---: |
| Native VM   | 8000 |
| Docker      | 8001 |

```text
Native VM
FastAPI
   │
   └── localhost:8000


Docker
FastAPI
   │
   └── localhost:8001
```

This configuration allowed requests to be directed separately to the VM and Docker application instances.

---

# 14. Overall Results

| Test                |  Native VM |     Docker |
| ------------------- | ---------: | ---------: |
| Compute Average     | 0.039293 s | 0.052390 s |
| Compute Minimum     | 0.035845 s | 0.049004 s |
| Compute Maximum     | 0.053111 s | 0.061435 s |
| Memory Average      | 0.031218 s | 0.034857 s |
| Memory Minimum      | 0.028431 s | 0.031907 s |
| Memory Maximum      | 0.041243 s | 0.043938 s |
| Concurrent Requests |        100 |        100 |
| Concurrency         |         10 |         10 |
| Failed Requests     |          0 |          0 |

---

# 15. Performance Analysis

## Compute

The Native VM recorded an average compute response time of **0.039293 seconds**, while Docker recorded **0.052390 seconds**.

This indicates that the measured compute workload completed faster in the Native VM configuration.

## Memory

The Native VM recorded an average memory response time of **0.031218 seconds**, while Docker recorded **0.034857 seconds**.

The measured difference was smaller than the compute test.

## Concurrent Requests

Both environments successfully handled:

```text
100 requests
10 concurrent requests
0 failed requests
```

Therefore, both environments successfully processed the tested concurrent workload.

## Docker Resource Usage

The Docker container used approximately:

```text
CPU:    0.24%
Memory: 111.9 MiB
```

during the recorded resource measurement.

---

# 16. Result Summary

The experiment produced the following observations:

* The Native VM recorded lower average response time for the compute workload.
* The Native VM also recorded slightly lower average response time for the memory workload.
* Both environments successfully handled 100 requests with a concurrency level of 10.
* No failed requests were recorded in the concurrent request test.
* The Docker container consumed approximately 0.24% CPU and 111.9 MiB memory during the recorded resource snapshot.
* The experiment demonstrates that performance differences depend on the specific workload and configuration.

These observations are based on the measurements collected during this experiment.

---

# 17. Screenshots and Experimental Evidence

The repository contains screenshots showing the commands, benchmark execution, Docker statistics, and recorded results.

The screenshots are stored in:

```text
screenshots/
```

Important evidence includes:

* Docker CPU/resource information
* Docker FIO benchmark output
* Docker memory benchmark output
* VM CPU benchmark output
* VM disk benchmark output
* FastAPI Docker resource information

The raw benchmark outputs and supporting files are also maintained in the project directories.

---

# 18. Project Structure

```text
VM-vs-Container-Performance/
│
├── api/
│   ├── Dockerfile
│   ├── main.py
│   └── requirements.txt
│
├── docker/
│   └── Dockerfile
│
├── docs/
│   ├── cpu-info.txt
│   ├── kernel-info.txt
│   ├── memory-info.txt
│   ├── storage-info.txt
│   └── vm-configuration.txt
│
├── results/
│   └── benchmark_results.txt
│
├── scripts/
│   ├── benchmark_api.sh
│   └── benchmark_summary.sh
│
├── screenshots/
│   ├── docker-cpu-limits-command.png
│   ├── docker-fio-sequential-read.png
│   ├── docker-fio-sequential-write.png
│   ├── fastapi-docker-resource-snapshot.png
│   ├── sysbench-memory-runs-summary.png
│   ├── vm-fio-sequential-read.png
│   └── vm-sysbench-cpu-run.png
│
├── .gitignore
└── README.md
```

---

# 19. Conclusion

This experiment compared a FastAPI application running directly on an Ubuntu Virtual Machine with the same application running inside a Docker container.

The experiment evaluated compute response time, memory response time, concurrent request handling, Docker resource usage, system memory, and networking configuration.

The measured results show differences between the two environments for the tested workloads, while both environments successfully handled the concurrent request test without failures.

The experiment provides practical measurements for understanding how VM-based and container-based application environments behave under the tested workloads.

---

## 20. Repository

The complete project, source code, scripts, benchmark outputs, documentation, and experimental screenshots are available in this repository:

[VM-vs-Container-Performance on GitHub](https://github.com/silicoder/VM-vs-Container-Performance?utm_source=chatgpt.com)
