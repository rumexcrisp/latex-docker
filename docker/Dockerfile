FROM archlinux

LABEL name="rumexcrisp/latex-docker"
LABEL version="v4"
LABEL description="LaTeX distribution with support for BibLaTeX and PDFlatex"
LABEL maintainer="rumexcrisp"

ARG USERNAME=latex
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG PLANTUML_VERSION=1.2024.4
ENV PLANTUML_JAR=/usr/share/java/plantuml/plantuml.jar

RUN pacman --noconfirm -Syu \
  bzip2 \
  curl \
  eza \
  git \
  git-lfs \
  gnuplot \
  graphviz \
  inkscape \
  jdk17-openjdk \
  make \
  neovim \
  noto-fonts \
  pdf2svg \
  python3 \
  sudo \
  texlive \
  zsh \
  zsh-autosuggestions \
  zsh-completions \
  zsh-history-substring-search \
  zsh-syntax-highlighting \
  && pacman --noconfirm -Sc \
  && rm -rf /var/cache/pacman/pkg/* /tmp/* /var/tmp/*

RUN mkdir -p "$(dirname ${PLANTUML_JAR})" \
  && curl -SL https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -o "${PLANTUML_JAR}" \
  && echo "PLANTUML_JAR=${PLANTUML_JAR}" >> /etc/environment

RUN groupadd -g ${USER_GID} ${USERNAME} \
  && useradd -m -u ${USER_UID} -g ${USER_GID} -s /bin/zsh ${USERNAME} \
  && passwd -d ${USERNAME} \
  && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
  && chmod 0440 /etc/sudoers.d/${USERNAME}

# RUN chown -R customuser:customuser ${PLANTUML_JAR}
USER ${USERNAME}
WORKDIR /home/${USERNAME}
COPY .zshrc .
RUN chown ${USERNAME}:${USERNAME} .zshrc
CMD ["/bin/zsh"]