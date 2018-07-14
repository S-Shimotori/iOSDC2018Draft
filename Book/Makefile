all:
	platex main
	mendex main
	biber main
	platex main
	platex main
	dvipdfmx -d 5 main

clean:
	rm -f main.aux main.bbl main.bcf main.blg main.dvi main.idx main.ilg main.ind main.out main.pdf main.run.xml main.toc
