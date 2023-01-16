echo "Install ROS noetic"

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
apt update
apt install -y ros-noetic-desktop-full

echo "Set up the workspace"
mkdir -p /root/catkin_ws/src
/bin/bash -c "source /opt/ros/noetic/setup.bash && \
              cd /root/catkin_ws/ && \
              catkin_make && \
              echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc && \
              echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc"

echo "Sourcing"
/bin/bash -c "source /opt/ros/noetic/setup.bash && \
              cd /root/catkin_ws/ && rm -rf build devel && \
              catkin_make"
