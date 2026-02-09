SHELL := bash

SRC_DIR := src
OUT_DIR := out
MAIN_CLASS := example.App

JAVA_FILES := $(shell find $(SRC_DIR) -name '*.java')

.PHONY: build clean run test

build:
	mkdir -p $(OUT_DIR)
	javac -d $(OUT_DIR) $(JAVA_FILES)

run: build
	java -cp $(OUT_DIR) $(MAIN_CLASS)

test: build
	java -cp $(OUT_DIR) example.AppTest

clean:
	rm -rf $(OUT_DIR)
