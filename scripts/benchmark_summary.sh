#!/bin/bash

echo "=============================================="
echo "       VM vs Docker Performance Test"
echo "=============================================="

test_endpoint() {
    NAME=$1
    URL=$2

    echo ""
    echo "Testing $NAME"
    echo "URL: $URL"
    echo "----------------------------------------------"

    for i in {1..20}
    do
        curl -s -o /dev/null -w "%{time_total}\n" "$URL"
    done > /tmp/times.txt

    AVG=$(awk '{sum += $1} END {printf "%.6f", sum/NR}' /tmp/times.txt)
    MIN=$(awk 'NR==1 || $1<min {min=$1} END {printf "%.6f", min}' /tmp/times.txt)
    MAX=$(awk 'NR==1 || $1>max {max=$1} END {printf "%.6f", max}' /tmp/times.txt)

    echo "Average: $AVG seconds"
    echo "Minimum: $MIN seconds"
    echo "Maximum: $MAX seconds"
}

echo ""
echo "========== /COMPUTE =========="

test_endpoint "Native VM" "http://localhost:8000/compute"
test_endpoint "Docker" "http://localhost:8001/compute"

echo ""
echo "========== /MEMORY =========="

test_endpoint "Native VM" "http://localhost:8000/memory"
test_endpoint "Docker" "http://localhost:8001/memory"

echo ""
echo "=============================================="
echo "Benchmark complete"
echo "=============================================="
