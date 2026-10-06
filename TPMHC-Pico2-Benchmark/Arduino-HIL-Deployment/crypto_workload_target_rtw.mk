###########################################################################
## Makefile generated for component 'crypto_workload_target'. 
## 
## Makefile     : crypto_workload_target_rtw.mk
## Generated on : Sat Jul 11 14:27:02 2026
## Final product: ./crypto_workload_target.lib
## Product type : static-library
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# MODELLIB                Static library target

PRODUCT_NAME              = crypto_workload_target
MAKEFILE                  = crypto_workload_target_rtw.mk
MATLAB_ROOT               = $(MATLAB_WORKSPACE)/C/Program_Files/MATLAB/R2026a
MATLAB_BIN                = $(MATLAB_WORKSPACE)/C/Program_Files/MATLAB/R2026a/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
START_DIR                 = $(MATLAB_WORKSPACE)/C/MATLAB_Project
TGT_FCN_LIB               = ISO_C
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 
RELATIVE_PATH_TO_ANCHOR   = ../../..
CUSTOM_C_FLAGS            = 
CUSTOM_CPP_FLAGS          = 
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 
MODELLIB                  = crypto_workload_target.lib

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          GNU GCC RPIUtils
# Supported Version(s):    
# ToolchainInfo Version:   2026a
# Specification Revision:  1.0
# 

#-----------
# MACROS
#-----------

CCOUTPUTFLAG = --output_file=
LDOUTPUTFLAG = --output_file=

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm -lrt -lpthread -ldl -lm -lstdc++ -lrt -lpthread -ldl

FORMAT_FOR_ECHO_CMD              = $(strip $(subst >,^>,\
	$(subst <,^<,\
	$(subst |,^|,\
	$(subst &,^&,\
	$(subst ",^",\
	$(subst ^,^^,\
	$1)))))))
FORMAT_FOR_ECHO_SH               = ""'$1'
SHELL_IS_CMD_EXE                := $(if $(findstring "$$SHELL",$(shell echo "$$SHELL")),1,)
FORMAT_FOR_ECHO                  = $(if $(SHELL_IS_CMD_EXE),$(FORMAT_FOR_ECHO_CMD),$(FORMAT_FOR_ECHO_SH))
HASH                             = \#
SEMICOLON                        = ;
UNESCAPE_SEMICOLONS              = $(subst \;,;,$1)
ADD_QUOTES                       = $(foreach aPath,$1,"$(aPath)")

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# Assembler: GNU GCC RPIUtils Assembler
AS = as

# C Compiler: GNU GCC RPIUtils C Compiler
CC = gcc

# Linker: GNU GCC RPIUtils Linker
LD = gcc

# C++ Compiler: GNU GCC RPIUtils C++ Compiler
CPP = g++

# C++ Linker: GNU GCC RPIUtils C++ Linker
CPP_LD = g++

# Archiver: GNU GCC RPIUtils Archiver
AR = ar

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: Make Tool
MAKE = make


#-------------------------
# Directives/Utilities
#-------------------------

ASDEBUG             = -g
AS_OUTPUT_FLAG      = -o
CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  =
ECHO                = echo
MV                  =
RUN                 =

#--------------------------------------
# "Faster Runs" Build Configuration
#--------------------------------------

ARFLAGS              = -r
ASFLAGS              = -c \
                       $(ASFLAGS_ADDITIONAL) \
                       $(INCLUDES)
CFLAGS               = -c \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -O2 \
                        -DMW_NUM_CORES=$(shell nproc)  \
                       $(CUSTOM_C_FLAGS)
CPPFLAGS             = -c \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -fpermissive  \
                       -O2 \
                        -DMW_NUM_CORES=$(shell nproc)  \
                       $(CUSTOM_CPP_FLAGS)
CPP_LDFLAGS          = -Wl,--no-as-needed
CPP_SHAREDLIB_LDFLAGS  = -shared  \
                         -Wl,--no-as-needed
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -Wl,--no-as-needed
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -j$(($(nproc)+1)) -Otarget -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    = -shared  \
                       -Wl,--no-as-needed



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = ./crypto_workload_target.lib
PRODUCT_TYPE = "static-library"
BUILD_TYPE = "Static Library"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR)/codegen/lib/crypto_workload_target -I$(START_DIR) -I$(MATLAB_ROOT)/toolbox/rpib/raspiML/include -I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils -I$(MATLAB_ROOT)/extern/include

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__
DEFINES_CUSTOM = 
DEFINES_SKIPFORSIL = -D__linux__ -DARM_PROJECT -D_USE_TARGET_UDP_ -D_RUNONTARGETHARDWARE_BUILD_ -DSTACK_SIZE=200000
DEFINES_STANDARD = -DMODEL=crypto_workload_target

DEFINES = $(DEFINES_) $(DEFINES_CUSTOM) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)/codegen/lib/crypto_workload_target/rt_nonfinite.c $(START_DIR)/codegen/lib/crypto_workload_target/rtGetNaN.c $(START_DIR)/codegen/lib/crypto_workload_target/rtGetInf.c $(START_DIR)/codegen/lib/crypto_workload_target/crypto_workload_target_initialize.c $(START_DIR)/codegen/lib/crypto_workload_target/crypto_workload_target_terminate.c $(START_DIR)/codegen/lib/crypto_workload_target/crypto_workload_target.c $(START_DIR)/codegen/lib/crypto_workload_target/log2.c $(MATLAB_ROOT)/toolbox/rpib/raspiML/src/linuxtimelogger/linuxTimeLogger.c

ALL_SRCS = $(SRCS)

###########################################################################
## OBJECTS
###########################################################################

OBJS = rt_nonfinite.c.o rtGetNaN.c.o rtGetInf.c.o crypto_workload_target_initialize.c.o crypto_workload_target_terminate.c.o crypto_workload_target.c.o log2.c.o linuxTimeLogger.c.o

ALL_OBJS = $(OBJS)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = $(LINUX_TARGET_LIBS_MACRO)

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_ = -fopenmp
CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_ = -fopenmp
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_ = -fopenmp

CPP_LDFLAGS += $(CPP_LDFLAGS_)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_ = -fopenmp

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_)

#-----------
# Linker
#-----------

LDFLAGS_ = -fopenmp

LDFLAGS += $(LDFLAGS_)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_ = -fopenmp

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_)

###########################################################################
## INLINED COMMANDS
###########################################################################


DERIVED_SRCS = $(subst .o,.dep,$(OBJS))

build:

%.dep:



-include codertarget_assembly_flags.mk
-include *.dep


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build clean info prebuild download execute


all : build
	echo $(call FORMAT_FOR_ECHO,### Successfully generated all binary outputs.)


build : prebuild $(PRODUCT)


prebuild : 


download : $(PRODUCT)


execute : download


###########################################################################
## FINAL TARGET
###########################################################################

#---------------------------------
# Create a static library         
#---------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS)
	echo $(call FORMAT_FOR_ECHO,### Creating static library "$(PRODUCT)" ...)
	$(AR) $(ARFLAGS)  $(PRODUCT) $(OBJS)
	echo $(call FORMAT_FOR_ECHO,### Created: "$(PRODUCT)")


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.c.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : %.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(RELATIVE_PATH_TO_ANCHOR)/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/codegen/lib/crypto_workload_target/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(START_DIR)/codegen/lib/crypto_workload_target/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(START_DIR)/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


rt_nonfinite.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/rt_nonfinite.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtGetNaN.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/rtGetNaN.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtGetInf.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/rtGetInf.c
	$(CC) $(CFLAGS) -o "$@" "$<"


crypto_workload_target_initialize.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/crypto_workload_target_initialize.c
	$(CC) $(CFLAGS) -o "$@" "$<"


crypto_workload_target_terminate.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/crypto_workload_target_terminate.c
	$(CC) $(CFLAGS) -o "$@" "$<"


crypto_workload_target.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/crypto_workload_target.c
	$(CC) $(CFLAGS) -o "$@" "$<"


log2.c.o : $(START_DIR)/codegen/lib/crypto_workload_target/log2.c
	$(CC) $(CFLAGS) -o "$@" "$<"


linuxTimeLogger.c.o : $(MATLAB_ROOT)/toolbox/rpib/raspiML/src/linuxtimelogger/linuxTimeLogger.c
	$(CC) $(CFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	echo $(call FORMAT_FOR_ECHO,### PRODUCT = $(PRODUCT))
	echo $(call FORMAT_FOR_ECHO,### PRODUCT_TYPE = $(PRODUCT_TYPE))
	echo $(call FORMAT_FOR_ECHO,### BUILD_TYPE = $(BUILD_TYPE))
	echo $(call FORMAT_FOR_ECHO,### INCLUDES = $(INCLUDES))
	echo $(call FORMAT_FOR_ECHO,### DEFINES = $(DEFINES))
	echo $(call FORMAT_FOR_ECHO,### ALL_SRCS = $(ALL_SRCS))
	echo $(call FORMAT_FOR_ECHO,### ALL_OBJS = $(ALL_OBJS))
	echo $(call FORMAT_FOR_ECHO,### LIBS = $(LIBS))
	echo $(call FORMAT_FOR_ECHO,### MODELREF_LIBS = $(MODELREF_LIBS))
	echo $(call FORMAT_FOR_ECHO,### SYSTEM_LIBS = $(SYSTEM_LIBS))
	echo $(call FORMAT_FOR_ECHO,### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS))
	echo $(call FORMAT_FOR_ECHO,### ASFLAGS = $(ASFLAGS))
	echo $(call FORMAT_FOR_ECHO,### CFLAGS = $(CFLAGS))
	echo $(call FORMAT_FOR_ECHO,### LDFLAGS = $(LDFLAGS))
	echo $(call FORMAT_FOR_ECHO,### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS))
	echo $(call FORMAT_FOR_ECHO,### CPPFLAGS = $(CPPFLAGS))
	echo $(call FORMAT_FOR_ECHO,### CPP_LDFLAGS = $(CPP_LDFLAGS))
	echo $(call FORMAT_FOR_ECHO,### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS))
	echo $(call FORMAT_FOR_ECHO,### ARFLAGS = $(ARFLAGS))
	echo $(call FORMAT_FOR_ECHO,### MEX_CFLAGS = $(MEX_CFLAGS))
	echo $(call FORMAT_FOR_ECHO,### MEX_CPPFLAGS = $(MEX_CPPFLAGS))
	echo $(call FORMAT_FOR_ECHO,### MEX_LDFLAGS = $(MEX_LDFLAGS))
	echo $(call FORMAT_FOR_ECHO,### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS))
	echo $(call FORMAT_FOR_ECHO,### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS))
	echo $(call FORMAT_FOR_ECHO,### EXECUTE_FLAGS = $(EXECUTE_FLAGS))
	echo $(call FORMAT_FOR_ECHO,### MAKE_FLAGS = $(MAKE_FLAGS))


clean : 
	$(ECHO) "### Deleting all derived files ..."
	$(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(RM) *.c.dep
	$(RM) *.cpp.dep
	$(ECHO) "### Deleted all derived files."


