#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  Copyright (c) %(date)s, David Sampson (samper.d@gmail.com)
#
#  license: GNU LGPL
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.


"""
Created on %(date)s

@author: %(username)s
"""

###################################
# Import standard library imports #
###################################
import importlib
import os
import datetime
import logging

######################################
# Import related third party imports #
######################################

#####################################################
# Import local application/library specific imports #
#####################################################

# Reload any libraries due to conflicts with IPython/Spyder etc
importlib.reload(importlib)

############
# Variables#
############


#############
# Constants #
#############

# Working directory
WORK_DIR = os.getcwd()
# Application Directory
APP_DIR = os.path.split(os.getcwd())[0]

# Temp Directory
TEMP_DIR = WORK_DIR + "/temp"

# Configure How dates appear
DATE = datetime.date.today().isoformat()
# Configure location of you selenium driver (eg Geko)
GEKOPATH = "/home/sampson/Applications/geko"


#######################
# Logging information #
#######################
LOG_FILE = "file.log"
# Log Directory
LOG_DIR = APP_DIR + "/logs"
# Defualt LOG_LEVEL = WARNING. Must be UPPER text
LOG_LEVEL = logging.DEBUG
#LOG_LEVEL = logging.INFO
#LOG_LEVEL = logging.WARNING
#LOG_LEVEL = logging.ERROR
LOG_FILE = LOG_DIR + "/log.txt"
LOG_FORMAT = "%(asctime)s %(levelname)s %(module)s %(funcName)s %(message)s"
logging.basicConfig(filename=LOG_FILE, level=LOG_LEVEL,
                    format=LOG_FORMAT)

##########################
# Set OS Environment PATH#
##########################

# os.environ['PATH'] += ':' + GEKOPATH



# Main function

def main():
    print("Hello World")


if __name__ == '__main__':
    main()

