#!/usr/bin/env bash

### Inicia container
exec /usr/sbin/apache2ctl -D FOREGROUND
