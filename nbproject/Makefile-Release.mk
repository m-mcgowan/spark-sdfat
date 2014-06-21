#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=MinGW-Windows
CND_DLIB_EXT=dll
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/MinimumSerial.o \
	${OBJECTDIR}/Sd2Card.o \
	${OBJECTDIR}/SdBaseFile.o \
	${OBJECTDIR}/SdBaseFilePrint.o \
	${OBJECTDIR}/SdFat.o \
	${OBJECTDIR}/SdFatErrorPrint.o \
	${OBJECTDIR}/SdFatUtil.o \
	${OBJECTDIR}/SdFile.o \
	${OBJECTDIR}/SdStream.o \
	${OBJECTDIR}/SdVolume.o \
	${OBJECTDIR}/StorageDevice.o \
	${OBJECTDIR}/istream.o \
	${OBJECTDIR}/ostream.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sdfat

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libsdfat.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libsdfat.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libsdfat.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libsdfat.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libsdfat.a

${OBJECTDIR}/MinimumSerial.o: MinimumSerial.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MinimumSerial.o MinimumSerial.cpp

${OBJECTDIR}/Sd2Card.o: Sd2Card.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Sd2Card.o Sd2Card.cpp

${OBJECTDIR}/SdBaseFile.o: SdBaseFile.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdBaseFile.o SdBaseFile.cpp

${OBJECTDIR}/SdBaseFilePrint.o: SdBaseFilePrint.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdBaseFilePrint.o SdBaseFilePrint.cpp

${OBJECTDIR}/SdFat.o: SdFat.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFat.o SdFat.cpp

${OBJECTDIR}/SdFatErrorPrint.o: SdFatErrorPrint.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFatErrorPrint.o SdFatErrorPrint.cpp

${OBJECTDIR}/SdFatUtil.o: SdFatUtil.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFatUtil.o SdFatUtil.cpp

${OBJECTDIR}/SdFile.o: SdFile.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFile.o SdFile.cpp

${OBJECTDIR}/SdStream.o: SdStream.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdStream.o SdStream.cpp

${OBJECTDIR}/SdVolume.o: SdVolume.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdVolume.o SdVolume.cpp

${OBJECTDIR}/StorageDevice.o: StorageDevice.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/StorageDevice.o StorageDevice.cpp

${OBJECTDIR}/istream.o: istream.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/istream.o istream.cpp

${OBJECTDIR}/ostream.o: ostream.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ostream.o ostream.cpp

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-conf ${TESTFILES}
${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sdfat: ${TESTDIR}/test/SdFatTest.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc}   -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sdfat $^ ${LDLIBSOPTIONS} 


${TESTDIR}/test/SdFatTest.o: test/SdFatTest.cpp 
	${MKDIR} -p ${TESTDIR}/test
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${TESTDIR}/test/SdFatTest.o test/SdFatTest.cpp


${OBJECTDIR}/MinimumSerial_nomain.o: ${OBJECTDIR}/MinimumSerial.o MinimumSerial.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MinimumSerial.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MinimumSerial_nomain.o MinimumSerial.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MinimumSerial.o ${OBJECTDIR}/MinimumSerial_nomain.o;\
	fi

${OBJECTDIR}/Sd2Card_nomain.o: ${OBJECTDIR}/Sd2Card.o Sd2Card.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/Sd2Card.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Sd2Card_nomain.o Sd2Card.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/Sd2Card.o ${OBJECTDIR}/Sd2Card_nomain.o;\
	fi

${OBJECTDIR}/SdBaseFile_nomain.o: ${OBJECTDIR}/SdBaseFile.o SdBaseFile.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdBaseFile.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdBaseFile_nomain.o SdBaseFile.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdBaseFile.o ${OBJECTDIR}/SdBaseFile_nomain.o;\
	fi

${OBJECTDIR}/SdBaseFilePrint_nomain.o: ${OBJECTDIR}/SdBaseFilePrint.o SdBaseFilePrint.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdBaseFilePrint.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdBaseFilePrint_nomain.o SdBaseFilePrint.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdBaseFilePrint.o ${OBJECTDIR}/SdBaseFilePrint_nomain.o;\
	fi

${OBJECTDIR}/SdFat_nomain.o: ${OBJECTDIR}/SdFat.o SdFat.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdFat.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFat_nomain.o SdFat.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdFat.o ${OBJECTDIR}/SdFat_nomain.o;\
	fi

${OBJECTDIR}/SdFatErrorPrint_nomain.o: ${OBJECTDIR}/SdFatErrorPrint.o SdFatErrorPrint.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdFatErrorPrint.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFatErrorPrint_nomain.o SdFatErrorPrint.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdFatErrorPrint.o ${OBJECTDIR}/SdFatErrorPrint_nomain.o;\
	fi

${OBJECTDIR}/SdFatUtil_nomain.o: ${OBJECTDIR}/SdFatUtil.o SdFatUtil.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdFatUtil.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFatUtil_nomain.o SdFatUtil.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdFatUtil.o ${OBJECTDIR}/SdFatUtil_nomain.o;\
	fi

${OBJECTDIR}/SdFile_nomain.o: ${OBJECTDIR}/SdFile.o SdFile.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdFile.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdFile_nomain.o SdFile.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdFile.o ${OBJECTDIR}/SdFile_nomain.o;\
	fi

${OBJECTDIR}/SdStream_nomain.o: ${OBJECTDIR}/SdStream.o SdStream.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdStream.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdStream_nomain.o SdStream.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdStream.o ${OBJECTDIR}/SdStream_nomain.o;\
	fi

${OBJECTDIR}/SdVolume_nomain.o: ${OBJECTDIR}/SdVolume.o SdVolume.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SdVolume.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SdVolume_nomain.o SdVolume.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SdVolume.o ${OBJECTDIR}/SdVolume_nomain.o;\
	fi

${OBJECTDIR}/StorageDevice_nomain.o: ${OBJECTDIR}/StorageDevice.o StorageDevice.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/StorageDevice.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/StorageDevice_nomain.o StorageDevice.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/StorageDevice.o ${OBJECTDIR}/StorageDevice_nomain.o;\
	fi

${OBJECTDIR}/istream_nomain.o: ${OBJECTDIR}/istream.o istream.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/istream.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/istream_nomain.o istream.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/istream.o ${OBJECTDIR}/istream_nomain.o;\
	fi

${OBJECTDIR}/ostream_nomain.o: ${OBJECTDIR}/ostream.o ostream.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/ostream.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ostream_nomain.o ostream.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/ostream.o ${OBJECTDIR}/ostream_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sdfat || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libsdfat.a

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
