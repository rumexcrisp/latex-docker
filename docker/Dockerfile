FROM fedora:38

LABEL name="rumexcrispp/latex-docker"
LABEL version="1.0.0"
LABEL description="LaTeX distribution with support for BibLaTeX and PDFlatex"
LABEL maintainer="rumexcrispp"

RUN dnf install -y --setopt=install_weak_deps=False \
  java-latest-openjdk \
  latexmk \
  make \
  pdf2svg \
  python3 \
  texlive-scheme-full \
  && dnf clean all