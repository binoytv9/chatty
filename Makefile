PKG_NAME=chatty
PKG_VERSION=1.0.0
UBAC_PKG_DEPENDS=
DEB_PKG_DEPENDS=
RPM_PKG_DEPENDS=

OBJ_NAME = $(PKG_NAME)

LIBS =

CPP = g++ 
CPPFLAGS = -g -Wall -fstack-protector-all -Wstack-protector -fno-defer-pop -Wformat -Wformat-security -fexceptions -finline-functions -fPIC -O2 -Wwrite-strings -Wparentheses -fpermissive

SRC = src
BIN = bin
LOCAL_INCLUDE_PATH = ./include/

INCLUDE = -I $(LOCAL_INCLUDE_PATH)
OBJ = $(BIN)/$(OBJ_NAME)

OBJFILES := $(patsubst $(SRC)/%.cpp,$(BIN)/%.o,$(wildcard $(SRC)/*.cpp))

all: bin OBJ

OBJ: $(OBJFILES)
	$(CPP) $(CPPFLAGS) $(OBJFILES) $(LIBS) -o $(OBJ)  

$(BIN)/%.o:$(SRC)/%.cpp $(LOCAL_INCLUDE_PATH)/*.h 
	$(CPP) $(CPPFLAGS) -c $< -o $@ $(INCLUDE) 

run:
	./$(OBJ)

bin:
	mkdir -p $(BIN)

clean:
	rm $(BIN)/* -rf

