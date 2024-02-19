GHC = ghc
SRC = $(file)
OUT = ./tmp/$(basename $(file))
TMP = ./tmp/$(dir $(file))

all: $(OUT)

$(OUT): $(SRC)
	mkdir -p $(TMP)
	$(GHC) -outputdir $(TMP) -o $(OUT) $(SRC)

run: $(OUT)
	$(OUT)

clean:
	rm -rf $(TMP) $(OUT)

.PHONY: all run clean