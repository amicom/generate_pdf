FROM gotenberg/gotenberg:7

USER root

RUN apt-get update -qq &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends -t bullseye-backports libreoffice-l10n-he &&\
    sed -i '/he_IL.UTF-8/s/^# //g' /etc/locale.gen &&\
    locale-gen &&\
    # Cleanup.
    # Note: the Debian image does automatically a clean after each install thanks to a hook.
    # Therefore, there is no need for apt-get clean.
    # See https://stackoverflow.com/a/24417119/3248473.
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG he_IL.UTF-8
ENV LANGUAGE he_IL:he
ENV LC_ALL he_IL.UTF-8

USER gotenberg
