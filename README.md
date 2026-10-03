# VM vs Container Performance Analysis

## 1. Project Overview

This project evaluates the performance differences between a **Virtual Machine (VM)** and a **Docker Container**.

The experiment compares the two environments using:

* Compute performance
* Memory performance
* Concurrent request handling
* Docker resource usage
* System memory usage
* Networking configuration

The main objective is to understand the performance overhead of containerization compared with running the application directly inside a Virtual Machine.

---

## 2. Objective

The main objectives of this experiment are:

1. Compare compute performance between a VM and a Docker container.
2. Compare memory performance between a VM and a Docker container.
3. Compare concurrent request handling between the two environments.
4. Measure Docker CPU and memory resource usage.
5. Observe the system memory available during the experiment.
6. Compare the networking configuration of the VM and Docker environments.
7. Understand the practical performance differences between VMs and containers.

---

## 3. VM vs Container

### Virtual Machine

A Virtual Machine virtualizes hardware and runs a complete guest operating system.

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

A VM requires its own operating system, which introduces additional CPU, memory, and storage requirements.

### Container

A container isolates an application while sharing the host operating system kernel.

```text
Application
     ↓
Container
     ↓
Host Operating System Kernel
     ↓
Physical Hardware
```

Containers do not require a separate guest operating system, allowing applications to run with relatively low resource overhead.

---

# 4. Experimental Environment

The experiment was performed inside an **Ubuntu 24.04 VM** using Docker.

### Environment

* Operating System: **Ubuntu 24.04**
* Virtualization Platform: **VMware Workstation**
* Container Technology: **Docker**
* Native VM API: `http://localhost:8000`
* Docker API: `http://localhost:8001`

### System Memory

The system reported the following memory information during the experiment:

| Parameter     |   Value |
| ------------- | ------: |
| Total RAM     | 8.1 GiB |
| Used RAM      | 1.7 GiB |
| Free RAM      | 4.2 GiB |
| Available RAM | 6.3 GiB |
| Swap          | 4.0 GiB |

---

# 5. Benchmark Tests

The project performs the following tests:

### 5.1 Compute Test

The compute test measures the time required to perform the computational workload.

The test records:

* Average execution time
* Minimum execution time
* Maximum execution time

### 5.2 Memory Test

The memory test measures the time required to perform the memory workload.

The test records:

* Average execution time
* Minimum execution time
* Maximum execution time

### 5.3 Concurrent Request Test

The concurrent request test evaluates how both environments handle multiple requests.

The experiment uses:

* Total requests: **100**
* Concurrency: **10**

The number of failed requests is also recorded.

### 5.4 Docker Resource Usage

Docker resource consumption is measured using container statistics.

The recorded metrics include:

* CPU usage
* Memory usage
* Network I/O
* Block I/O
* Number of processes

---

# 6. Compute Performance Results

The following results were obtained from the benchmark.

| Environment |    Average |    Minimum |    Maximum |
| ----------- | ---------: | ---------: | ---------: |
| Native VM   | 0.039293 s | 0.035845 s | 0.053111 s |
| Docker      | 0.052390 s | 0.049004 s | 0.061435 s |

### Analysis

The measured average compute execution time was:

* Native VM: **0.039293 seconds**
* Docker: **0.052390 seconds**

The minimum and maximum execution times were also recorded for both environments.

These measurements show the observed performance of the specific workload under the experimental conditions.

---

# 7. Memory Performance Results

| Environment |    Average |    Minimum |    Maximum |
| ----------- | ---------: | ---------: | ---------: |
| Native VM   | 0.031218 s | 0.028431 s | 0.041243 s |
| Docker      | 0.034857 s | 0.031907 s | 0.043938 s |

### Analysis

The measured average memory-test execution time was:

* Native VM: **0.031218 seconds**
* Docker: **0.034857 seconds**

The minimum and maximum execution times were also recorded.

The difference between the environments is relatively small for this particular workload.

---

# 8. Concurrent Request Test

The same concurrent request workload was executed in both environments.

### Test Configuration

```text
Requests: 100
Concurrency: 10
```

### Results

| Environment | Requests | Concurrency | Failed Requests |
| ----------- | -------: | ----------: | --------------: |
| Native VM   |      100 |          10 |               0 |
| Docker      |      100 |          10 |               0 |

### Analysis

Both environments successfully processed all **100 requests** with a concurrency level of **10**.

No failed requests were recorded in either environment.

---

# 9. Docker Resource Usage

Docker container resource usage was measured during the experiment.

| Resource     |    Observed Value |
| ------------ | ----------------: |
| CPU Usage    |            ~0.24% |
| Memory Usage |        ~111.9 MiB |
| Memory Limit |         8.062 GiB |
| Network I/O  | 286 KiB / 319 KiB |
| Block I/O    |     0 B / 799 KiB |
| Processes    |                11 |

### Analysis

The Docker container used approximately **0.24% CPU** and **111.9 MiB of memory** during the observed measurement.

The container statistics also recorded its network I/O, block I/O and number of processes.

---

# 10. System Memory During Experiment

The system memory information observed during the experiment was:

```text
Total RAM:      8.1 GiB
Used RAM:       1.7 GiB
Free RAM:       4.2 GiB
Available RAM:  6.3 GiB
Swap:           4.0 GiB
```

This information provides the memory context in which the benchmark was executed.

---

# 11. Docker Networking

The application was exposed using different ports for the native VM and Docker environments.

| Environment | Port |
| ----------- | ---: |
| Native VM   | 8000 |
| Docker      | 8001 |

### Endpoints

```text
Native VM:
http://localhost:8000

Docker:
http://localhost:8001
```

The separate ports allow the application running directly in the VM and the containerized application to be tested independently.

---

# 12. Methodology

The experiment follows these steps:

### Step 1 — Configure the VM

The application is executed inside the Ubuntu 24.04 Virtual Machine.

### Step 2 — Run the Native VM Application

The application is started directly inside the VM and exposed through:

```text
http://localhost:8000
```

### Step 3 — Run the Docker Application

The same application is containerized using Docker and exposed through:

```text
http://localhost:8001
```

### Step 4 — Run Compute Test

The compute workload is executed and the following values are recorded:

* Average execution time
* Minimum execution time
* Maximum execution time

### Step 5 — Run Memory Test

The memory workload is executed and the following values are recorded:

* Average execution time
* Minimum execution time
* Maximum execution time

### Step 6 — Run Concurrent Request Test

Both environments are tested using:

```text
100 requests
Concurrency: 10
```

The number of failed requests is recorded.

### Step 7 — Measure Docker Resources

Docker statistics are collected to observe:

* CPU usage
* Memory usage
* Network I/O
* Block I/O
* Process count

### Step 8 — Record System Resources

System memory information is collected using Linux system monitoring commands.

---

# 13. Overall Results

| Metric          |  Native VM |     Docker |
| --------------- | ---------: | ---------: |
| Compute Average | 0.039293 s | 0.052390 s |
| Compute Minimum | 0.035845 s | 0.049004 s |
| Compute Maximum | 0.053111 s | 0.061435 s |
| Memory Average  | 0.031218 s | 0.034857 s |
| Memory Minimum  | 0.028431 s | 0.031907 s |
| Memory Maximum  | 0.041243 s | 0.043938 s |
| Requests        |        100 |        100 |
| Concurrency     |         10 |         10 |
| Failed Requests |          0 |          0 |
| Port            |       8000 |       8001 |

---

# 14. Performance Analysis

## Compute Performance

The native VM recorded an average compute execution time of **0.039293 seconds**, while Docker recorded **0.052390 seconds** for the measured workload.

The benchmark therefore provides a direct measurement of the execution-time difference under the tested configuration.

## Memory Performance

The native VM recorded an average memory-test execution time of **0.031218 seconds**, while Docker recorded **0.034857 seconds**.

The measured difference was smaller than the difference observed in the compute test.

## Concurrent Requests

Both environments successfully handled:

```text
100 requests
10 concurrent requests
0 failed requests
```

Therefore, both environments completed the tested concurrent workload successfully.

## Resource Usage

The Docker container was observed using approximately:

```text
CPU:    0.24%
Memory: 111.9 MiB
```

during the resource measurement.

---

# 15. Important Experimental Observation

The results in this project are measurements from the specific experimental environment and workload.

Performance can vary depending on:

* CPU configuration
* Number of VM CPU cores
* Allocated VM memory
* Host hardware
* VMware configuration
* Docker configuration
* Storage system
* Background processes
* Workload characteristics
* Operating system configuration

Therefore, the measured results should be interpreted as experimental results rather than universal performance characteristics.

---

# 16. VM vs Container Comparison

| Feature              | Virtual Machine                  | Container                   |
| -------------------- | -------------------------------- | --------------------------- |
| Virtualization Level | Hardware / system virtualization | Operating-system level      |
| Guest OS             | Required                         | Not required                |
| Kernel               | Separate guest kernel            | Shared host kernel          |
| Isolation            | Strong                           | Application-level isolation |
| Startup              | Generally slower                 | Generally faster            |
| Resource Overhead    | Generally higher                 | Generally lower             |
| Portability          | High                             | High                        |
| Resource Efficiency  | Generally lower                  | Generally higher            |

---

# 17. Advantages of Containers

* Lightweight
* Fast startup
* Lower resource overhead
* Efficient resource utilization
* Easy application deployment
* Good portability
* Multiple containers can run on the same host

---

# 18. Advantages of Virtual Machines

* Strong isolation
* Complete guest operating system
* Can run different operating systems
* Useful for infrastructure virtualization
* Provides a complete virtual hardware environment
* Mature virtualization ecosystem

---

# 19. Project Structure

```text
VM-vs-Container-Performance/
│
├── README.md
│
├── api/
│   ├── main.py
│   ├── Dockerfile
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
└── scripts/
    ├── benchmark_api.sh
    └── benchmark_summary.sh
```

---

# 20. Technologies Used

* Ubuntu 24.04
* VMware Workstation
* Docker
* Linux
* Python
* FastAPI
* Shell Scripting
* REST API
* System Benchmarking
* Performance Analysis

---

# 21. Conclusion

This project experimentally compares a native application running inside an Ubuntu Virtual Machine with the same application running inside a Docker container.

The experiment evaluates compute performance, memory performance, concurrent request handling, Docker resource usage, system memory and networking.

The measured results show:

* Native VM compute average: **0.039293 seconds**
* Docker compute average: **0.052390 seconds**
* Native VM memory average: **0.031218 seconds**
* Docker memory average: **0.034857 seconds**
* Both environments processed **100 requests**
* Both used a concurrency level of **10**
* Both recorded **0 failed requests**
* Docker CPU usage observed: **~0.24%**
* Docker memory usage observed: **~111.9 MiB**

The experiment demonstrates how performance can be measured quantitatively when comparing virtualization approaches. The results are specific to the hardware, software configuration and workloads used in this experiment.
