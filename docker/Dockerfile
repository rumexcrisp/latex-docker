FROM fedora:40

LABEL name="rumexcrisp/latex-docker"
LABEL version="v4"
LABEL description="LaTeX distribution with support for BibLaTeX and PDFlatex"
LABEL maintainer="rumexcrisp"

ARG PLANTUML_VERSION=1.2024.4
ENV PLANTUML_JAR=/usr/share/java/plantuml/plantuml.jar

ARG USERNAME=latex
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN dnf install -y --setopt=install_weak_deps=False \
  bzip2 \
  curl \
  git-lfs \
  gnuplot \
  graphviz \
  inkscape \
  java-17-openjdk \
  latexmk \
  make \
  pdf2svg \
  python3 \
  texlive-scheme-full \
  vim \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  && dnf clean all

RUN mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -SL https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >> /etc/environment

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /usr/bin/zsh
COPY .zshrc /home/$USERNAME/.zshrc
RUN chown $USERNAME:$USERNAME /home/$USERNAME/.zshrc
USER $USERNAME
WORKDIR /home/$USERNAME

CMD ["/bin/zsh"]