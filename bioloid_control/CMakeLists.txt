include_directories(
  include/
  src/usb2ax
)

# Bioloid Hardware Interface
add_library(bioloid_hw_interface
  src/bioloid_hw_interface.cpp
  src/usb2ax/dxl_hal.c
  src/usb2ax/dynamixel_syncread.c
)
target_link_libraries(bioloid_hw_interface
  generic_hw_interface
  ${catkin_LIBRARIES}
)

# Main control executable
add_executable(bioloid_hw_main src/bioloid_hw_main.cpp)
target_link_libraries(bioloid_hw_main
  bioloid_hw_interface
  generic_hw_control_loop
  ${catkin_LIBRARIES}
)

## Install ------------------------------------------------------------

# Install libraries
install(TARGETS
    bioloid_hw_interface
  LIBRARY DESTINATION
    ${CATKIN_PACKAGE_LIB_DESTINATION}
)

# Install executables
install(TARGETS
    bioloid_hw_main
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

# Install header files
install(DIRECTORY include/bioloid_control/   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})
