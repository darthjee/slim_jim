FROM darthjee/ruby_250:0.6.1 as base
FROM darthjee/scripts:0.1.8 as scripts

######################################

FROM base as builder

ADD source/Gemfile* /home/app/app/

ENV HOME_DIR /home/app

COPY --chown=app:app --from=scripts /home/scripts/builder/bundle_builder.sh /usr/local/sbin/bundle_builder.sh
RUN /bin/bash bundle_builder.sh

#######################
#FINAL IMAGE
FROM base

COPY --chown=app:app --from=builder /home/app/bundle/ /usr/local/bundle/
ADD source/Gemfile* /home/app/app/
RUN bundle install
