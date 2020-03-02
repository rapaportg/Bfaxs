FROM google/dart

WORKDIR /bfaxs
ADD pubspec.* /bfaxs/

RUN groupadd -r aqueduct
RUN useradd -m -r -g aqueduct aqueduct
RUN chown -R aqueduct:aqueduct /bfaxs

USER aqueduct
RUN pub get --no-precompile

USER root
ADD . /bfaxs
RUN chown -R aqueduct:aqueduct /bfaxs

USER aqueduct
RUN pub get --offline --no-precompile

EXPOSE 8082

ENTRYPOINT ["pub", "run", "aqueduct:aqueduct", "serve", "--port", "8082"]