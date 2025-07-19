import time
import numpy as np
import os
import psutil

print("Starting elasticity test...")

load_steps = 10
matrix_size = 300

for step in range(1, load_steps + 1):
    start = time.time()

    # Increase workload linearly
    workload = np.random.rand(matrix_size * step, matrix_size * step)
    result = np.matmul(workload, workload)

    end = time.time()
    mem = psutil.virtual_memory()
    cpu = psutil.cpu_percent(interval=0.5)

    print(f"Step {step}: Time = {end - start:.2f}s | CPU = {cpu}% | Free RAM = {mem.available // (1024 * 1024)} MB")

    time.sleep(1)
