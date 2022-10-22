FROM ocaml/opam:debian-11-ocaml-4.14
WORKDIR .
ENV PATH="${PATH}:${HOME}/.opam/4.14/bin"
COPY --chown=opam . ./
RUN sudo apt install pkg-config sqlite3 libev-dev libsqlite3-dev -y
RUN opam install dune opium sqlite3 yojson
RUN dune build main.exe
EXPOSE 4000
CMD ["dune", "exec", "./main.exe"]
