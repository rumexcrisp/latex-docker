FROM fedora:40

LABEL name="rumexcrisp/latex-docker"
LABEL version="v3"
LABEL description="LaTeX distribution with support for BibLaTeX and PDFlatex"
LABEL maintainer="rumexcrisp"

ARG PLANTUML_VERSION=1.2024.4
ENV PLANTUML_JAR /usr/share/java/plantuml/plantuml.jar

RUN dnf install -y --setopt=install_weak_deps=False \
  vim \
  gnuplot \
  bzip2 \
  curl \
  git-lfs \
  graphviz \
  inkscape \
  java-17-openjdk \
  latexmk \
  make \
  pdf2svg \
  python3 \
  texlive-scheme-full \
  && dnf clean all

RUN mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -SL https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >> /etc/environment