FROM node:10-slim

# add oracle instantclient binaries
ADD ./oracle/linux/*.zip ./

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV OCI_INCLUDE_DIR="/opt/oracle/instantclient/sdk/include"
ENV OCI_VERSION=12

# install dependencies and extract binaries`
RUN apt-get update \
  && apt-get install -y unzip libaio1 \
  && mkdir -p /opt/oracle \
  && unzip instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
  && unzip instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
  && mv "${LD_LIBRARY_PATH}_12_2" $LD_LIBRARY_PATH \
  && ln -s "${LD_LIBRARY_PATH}/libclntsh.so.12.2 "${LD_LIBRARY_PATH}/libclntsh.so" \
  && ln -s "${LD_LIBRARY_PATH}/libocci.so.12.2 "${LD_LIBRARY_PATH}/libocci.so" \
  && rm -f instantclient-*.zip \
  && apt-get remove -y unzip \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN echo "${LD_LIBRARY_PATH}" | tee -a /etc/ld.so.conf.d/oracle_instant_client.conf && ldconfig