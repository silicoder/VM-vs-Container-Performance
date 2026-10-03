#!/bin/bash

echo "========================================"
echo " VM vs Docker API Performance Benchmark"
echo "========================================"

echo ""
echo "Testing /compute"
echo "----------------"

echo "Native VM (port 8000):"

for i in {1..10}
do
    curl -s -o /dev/null -w "%{time_total}\n" http://localhost:8000/compute
done

echo ""
echo "Docker (port 8001):"

for i in {1..10}
do
    curl -s -o /dev/null -w "%{time_total}\n" http://localhost:8001/compute
done

echo ""
echo "Testing /memory"
echo "---------------"

echo "Native VM (port 8000):"

for i in {1..10}
do
    curl -s -o /dev/null -w "%{time_total}\n" http://localhost:8000/memory
done

echo ""
echo "Docker (port 8001):"

for i in {1..10}
do
    curl -s -o /dev/null -w "%{time_total}\n" http://localhost:8001/memory
done
