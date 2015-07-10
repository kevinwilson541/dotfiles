#!/usr/bin/python
import os
import optparse
from subprocess import Popen, PIPE

parser = optparse.OptionParser()
parser.add_option('-i', '--inc', type='int', dest='incVal')
parser.add_option('-d', '--dec', type='int', dest='decVal')
parser.add_option('-s', '--set', type='int', dest='setVal')

(options, args) = parser.parse_args()
path = '/sys/class/backlight/radeon_bl0/brightness'
maxPath = '/sys/class/backlight/radeon_bl0/max_brightness'
out, err = Popen(['cat',maxPath], stdout=PIPE, stderr=PIPE).communicate()
maxBrightness = int(out)
out, err = Popen(['cat',path], stdout=PIPE, stderr=PIPE).communicate()
brightness = int(out)

if options.setVal:
    if options.setVal >= 0 and options.setVal <= maxBrightness:
        os.system('expr ' + str(options.setVal) + ' | sudo dd of=' + path)
    else:
        print 'ERROR: must input value between 0 and ' + str(maxBrightness)
elif options.incVal:
    val = options.incVal + brightness
    if val >= 0 and val <= maxBrightness:
        os.system('expr ' + str(val) + ' | sudo dd of=' + path)
    else:
        print 'ERROR: current brightness of ' + str(brightness) + ' plus increment value went over maximum of ' + str(maxBrightness)
elif options.decVal:
    val = brightness - options.decVal
    if val >= 0 and val <= maxBrightness:
        os.system('expr ' + str(val) + ' | sudo dd of=' + path)
    else:
        print 'ERROR: current brightness of ' + str(brightness) + ' minus decrement value went under 0'
else:
    print 'usage: bright --[set|inc|dec] num'
