FROM ubuntu:22.04

LABEL maintainer="ashutoshtrirpform@gmail.com"
LABEL purpose="Compare Docker with VirtualBox"

ENV DEBIAN_FRONTEND=noninteractive

# Install base tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    time \
    htop \
    curl \
    build-essential \
    && apt-get clean

# Create working dir
WORKDIR /benchmark

# Copy all Python scripts and model
COPY benchmark.py .
COPY elasticity_test.py .
COPY app.py .
COPY model.pkl .

# Install Python packages
RUN pip3 install flask scikit-learn joblib gunicorn numpy

# Expose Flask app port
EXPOSE 5000

# Default CMD starts bash (for benchmark control)
CMD ["bash"]
