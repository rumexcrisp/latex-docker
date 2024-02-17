FROM fedora:39

LABEL name="rumexcrispp/latex-docker"
LABEL version="v2"
LABEL description="LaTeX distribution with support for BibLaTeX and PDFlatex"
LABEL maintainer="rumexcrispp"

RUN dnf install -y --setopt=install_weak_deps=False \
  neovim \
  latexmk \
  make \
  pdf2svg \
  python3 \
  texlive-scheme-full \
  && dnf clean all