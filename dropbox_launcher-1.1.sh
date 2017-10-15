#!/bin/bash
export DBUS_SESSION_BUS_ADDRESS=""
dropbox stop && dbus-launch dropbox start
