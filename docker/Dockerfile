FROM fedora:38

LABEL name="rumexcrispp/latex-docker"
LABEL version="1.0.0"
LABEL description="LaTeX distribution with support for BibLaTeX and PDFlatex"
LABEL maintainer="rumexcrispp"

RUN dnf install -y --setopt=install_weak_deps=False \
  latexmk \
  make \
  pdf2svg \
  texlive-scheme-full \
  && dnf clean all

RUN git clone -b main https://github.com/cmhughes/latexindent.pl /tmp/latexindent