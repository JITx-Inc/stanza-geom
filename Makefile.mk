stanza_geom_all: ${GEN}/geom.pkg ${GEN}/geom-gfx.pkg 

ALL_PKG_DEPS += stanza_geom_all

${GEN}/geom.pkg: stanza-geom/geom.stanza ${GEN}/utils.pkg 
	stanza $< $(STZ_FLAGS)

${GEN}/geom-gfx.pkg: stanza-geom/geom-gfx.stanza ${GEN}/geom.pkg ${GEN}/gfx.pkg ${GEN}/font.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/grid.o: stanza-geom/grid.cpp
	g++ $(CFLAGS) -funroll-loops -O3 -c $< -o $@

${GEN}/grid.pkg: stanza-geom/grid.stanza ${GEN}/utils.pkg ${GEN}/gl.pkg ${GEN}/gfx.pkg 
	stanza $< ${STZ_FLAGS}

${GEN}/nester.pkg: stanza-geom/nester.stanza ${GEN}/utils.pkg ${GEN}/gl.pkg ${GEN}/gfx.pkg ${GEN}/grid.pkg
	stanza $< ${STZ_FLAGS}

