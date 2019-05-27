IF( "$ENV{SIFTGPUROOT}" STREQUAL "" )
  MESSAGE(STATUS "SIFTGPUROOT environment variable not set." )
  MESSAGE(STATUS "This can be done in your user .bashrc file by appending the corresponding line, e.g:" )
  MESSAGE(STATUS "export SIFTGPUROOT=/opt/SiftGPU" )
  MESSAGE(STATUS "You can download SiftGPU http://www.cs.unc.edu/~ccwu/siftgpu/")
  MESSAGE(STATUS "Minimal Dependencies are with DevIL1.77, GLEW 1.51, GLUT(viewer only)")
  
  SET(SIFTGPU_FOUND 0)
ELSE( "$ENV{SIFTGPUROOT}" STREQUAL "" )
  SET(SIFTGPU_LIBS -lsiftgpu -ldl -lCg -lCgGL -lglut -lIL -lGLEW)
  INCLUDE_DIRECTORIES( "$ENV{SIFTGPUROOT}/inc-pc/")
  ADD_DEFINITIONS(-DCOMPILE_SIFTGPU=1)
  ADD_DEFINITIONS(-D_LINUX=1)
  SET(SIFTGPU_FOUND 1)
  SET (LIBS ${LIBS} ${SIFTGPU_LIBS} -L$ENV{SIFTGPUROOT}/linux/bin)
  INCLUDE_DIRECTORIES( "$ENV{SIFTGPUROOT}/src/SiftGPU/")
ENDIF( "$ENV{SIFTGPUROOT}" STREQUAL "" )
