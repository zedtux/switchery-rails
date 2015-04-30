# Switchery-rails gem Dockerfile
#
# How to use it
# =============
#
# $ sudo docker build -t zedtux/switchery-rails .
# $ sudo docker run -it zedtux/switchery-rails
# rake build             # Build switchery-rails-0.1.0.gem into the pkg directory
# rake install           # Build and install switchery-rails-0.1.0.gem into system gems
# rake install:local     # Build and install switchery-rails-0.1.0.gem into system gems without network access
# rake release           # Create tag v0.1.0 and build and push switchery-rails-0.1.0.gem to Rubygems
# rake update_switchery  # Update the Switchery Javascript and CSS files
#
# Update the Switchery library
# ----------------------------
#
# Update the file `lib/switchery/rails/version.rb` in order to set the Switchery version to download then:
#
# $ sudo docker run --rm -v `pwd`:/gem/ -it zedtux/switchery-rails rake update_switchery
# Downlading Switchery 0.8.0 ...
# Done!
#

# ~~~~ Image base ~~~~
# Base image with the latest Ruby only
FROM litaio/ruby:2.2.2
MAINTAINER Guillaume Hain zedtux@zedroot.org


# ~~~~ Set up the environment ~~~~
ENV DEBIAN_FRONTEND noninteractive

# ~~~~ OS Maintenance ~~~~
RUN apt-get update && apt-get install -y git

# ~~~~ Rails Preparation ~~~~
# Rubygems and Bundler
RUN touch ~/.gemrc && \
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc && \
  gem install rubygems-update && \
  update_rubygems && \
  gem install bundler && \
  mkdir -p /gem/

WORKDIR /gem/
ADD . /gem/
RUN bundle install

# Import the gem source code
VOLUME .:/gem/

ENTRYPOINT ["bundle", "exec"]
CMD ["rake", "-T"]
