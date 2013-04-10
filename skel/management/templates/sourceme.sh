# __BEGIN_LICENSE__
# Copyright (C) 2008-2010 United States Government as represented by
# the Administrator of the National Aeronautics and Space Administration.
# All Rights Reserved.
# __END_LICENSE__

{% if virtualEnvDir %}
# Activate virtualenv environment
source {{ virtualEnvDir }}/bin/activate
{% endif %}

# Set DJANGO_SCRIPT_NAME to the URL prefix for Django on your web server (with leading slash
# and trailing slash).  This setting is ignored if using the built-in Django development web
# server.
export DJANGO_SCRIPT_NAME='/$$$$SITE_NAME$$$$/'

# The auto-generated PYTHONPATH usually works, but you might need to add more directories
# depending on how you installed everything.
export PYTHONPATH={{ parentDir }}:{{ appsDir }}:$PYTHONPATH

# You should not need to change this.
export DJANGO_SETTINGS_MODULE='$$$$SITE_NAME$$$$.settings'

# Avoid Mountain Lion-specific problem with LANG env variable
if [ -x "/usr/bin/sw_vers" ]; then
  sw_vers | grep 10.8 > /dev/null
  if [ "$?" == "0" ]; then
    export LANG="en_US.UTF-8"
  fi
fi
