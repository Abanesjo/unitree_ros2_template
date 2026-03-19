FROM ros:humble

RUN apt update && apt upgrade -y

# ROS2 and build deps
RUN apt install -y \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-rosidl-generator-dds-idl \
    ros-humble-rosbag2-cpp \
    libyaml-cpp-dev \
    libeigen3-dev

# Workspace setup
WORKDIR /workspace/src/unitree_ros2

COPY . .

# Build all packages
WORKDIR /workspace

SHELL ["/bin/bash", "-c"]

RUN source /opt/ros/humble/setup.bash && \
    colcon build --parallel-workers $(( $(nproc) / 2 ))

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
