
# ur3 pkgs
cd /root/catkin_ws/src
git clone https://github.com/pal-robotics/gazebo_ros_link_attacher
git clone -b noetic-devel https://github.com/cambel/robotiq
git clone https://github.com/cambel/ros_robotiq_urcap_control.git
git clone https://bitbucket.org/traclabs/trac_ik.git
git clone -b melodic-devel https://github.com/ros-industrial/universal_robot
# git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver.git
git clone -b noetic-devel https://github.com/cambel/ur3.git
git clone https://github.com/cambel/ur_ikfast.git

# python
apt install python3-pip -y
pip3 install -U numpy Cython
pip3 install -U rosdep
pip3 install -U scipy
rosdep init
rosdep update
apt install python-is-python3 -y

# ros dependencies
cd ..
/bin/bash -c "source /opt/ros/noetic/setup.bash && \
              cd /root/catkin_ws/ && rm -rf build devel && \
              rosdep install --from-paths src --ignore-src --rosdistro=noetic -y"
apt -y install ros-noetic-gazebo-ros-control ros-noetic-effort-controllers\
               ros-noetic-pyquaternion ros-noetic-ur-msgs libblas-dev liblapack-dev

# ur_ikfast dependencies
apt install libblas-dev liblapack-dev
cd src/ur_ikfast && pip install -e . && cd ../..

# compile
/bin/bash -c "source /opt/ros/noetic/setup.bash && \
              cd /root/catkin_ws/ && rm -rf build devel && \
              catkin_make"
