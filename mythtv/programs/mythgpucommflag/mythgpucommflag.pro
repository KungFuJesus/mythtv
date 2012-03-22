include (../../settings.pro)
include (../../version.pro)
include ( ../programs-libs.pro )

TEMPLATE = app
CONFIG += thread
target.path = $${PREFIX}/bin
INSTALLS = target

clfiles.path = $${PREFIX}/share/mythtv/mythgpucommflag/
clfiles.files  = kernels/audioVolumeLevel64.cl kernels/audioVolumeLevel.cl
clfiles.files += kernels/videoConvert.cl kernels/videoWavelet.cl
clfiles.files += kernels/videoHistogram.cl kernels/videoInverse.cl
clfiles.files += kernels/videoXCorrelate.cl kernels/videoAspect.cl
INSTALLS += clfiles

QMAKE_CLEAN += $(TARGET)

# For NVIDIA SDK
SDK = /opt/NVIDIA_GPU_Computing_SDK
INCLUDEPATH += $$SDK/OpenCL/common/inc
QMAKE_LIBDIR += $$SDK/OpenCL/common/lib

# For AMD SDK
#SDK = /opt/AMDAPP
#INCLUDEPATH += $$SDK/include
#QMAKE_LIBDIR += $$SDK/lib/x86_64

LIBS += -lOpenCL -lglut -lGLEW

# Input
HEADERS += commandlineparser.h
HEADERS += openclinterface.h openglsupport.h
HEADERS += packetqueue.h
HEADERS += flagresults.h findingdefs.h
HEADERS += gpuplayer.h
HEADERS += queueconsumer.h audioconsumer.h videoconsumer.h
HEADERS += audioprocessor.h videoprocessor.h
HEADERS += audiopacket.h videopacket.h videosurface.h
HEADERS += videodecoder.h vdpauvideodecoder.h ffmpegvideodecoder.h

SOURCES += main.cpp commandlineparser.cpp
SOURCES += openclinterface.cpp
SOURCES += packetqueue.cpp flagresults.cpp
SOURCES += gpuplayer.cpp
SOURCES += queueconsumer.cpp audioconsumer.cpp videoconsumer.cpp
SOURCES += audioprocessor.cpp videoprocessor.cpp
SOURCES += openclaudioprocessor.cpp softwareaudioprocessor.cpp
SOURCES += openclvideoprocessor.cpp softwarevideoprocessor.cpp
SOURCES += audiopacket.cpp videopacket.cpp videosurface.cpp
SOURCES += vdpauvideodecoder.cpp ffmpegvideodecoder.cpp

QT += xml sql network

using_x11:DEFINES += USING_X11
using_xv:DEFINES += USING_XV
using_xrandr:DEFINES += USING_XRANDR
using_opengl:QT += opengl
using_opengl:DEFINES += USING_OPENGL
using_opengl_video:DEFINES += USING_OPENGL_VIDEO
using_vdpau:DEFINES += USING_VDPAU
