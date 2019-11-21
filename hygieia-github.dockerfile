FROM capitalone/hygieia-github-scm-collector:latest
COPY resources/github/application.properties /hygieia/config/application.properties
COPY resources/github/properties-builder.sh  /hygieia/
CMD chmod +x /hygieia/properties-builder.sh


WORKDIR /hygieia
#env properties 
ENV PROP_FILE /hygieia/config/application.properties

CMD /hygieia/properties-builder.sh && \
  java -jar github-scm-collector*.jar --spring.config.location=$PROP_FILE
