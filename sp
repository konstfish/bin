#!/usr/local/bin/python3

import sys, os
import time

from wasp_spotify_bindings.core import Wasp
wasp = Wasp()

if(len(sys.argv) == 1):
    wasp.start_spotify()

p = os.popen('pgrep Spotify')
s = p.readline()
p.close()
if(s == ""):
    wasp.start_spotify()


if(len(sys.argv) > 1):
    if(sys.argv[1] == "vol"):
        if(len(sys.argv) < 2):
            print("Not enough arguments given.")
        else:
            if(sys.argv[2] == "up"):
                try:
                    if(len(sys.argv) == 3):
                        wasp.volume_up()
                    # else:
                    #     wasp.volume_up(volume=int(sys.argv[3]))
                except:
                    print("error" + sys.argv[3])
            elif(sys.argv[2] == "down"):
                try:
                    if(len(sys.argv) == 3):
                        wasp.volume_down()
                    # else:
                    #     wasp.volume_down(volume=int(sys.argv[3]))
                except:
                    print("error")
            else:
                try:
                    wasp.set_volume(volume=int(sys.argv[2]))
                except:
                    print("error")

    elif(sys.argv[1] == "play" or sys.argv[1] == "p"):
        state = wasp.get_state()
        if(state['state'] == 'paused'):
            wasp.play_pause()
        else:
            wasp.pause()

    elif(sys.argv[1] == "skip"):
        wasp.next_track()

    elif(sys.argv[1] == "prev"):
        wasp.previous_track()

    elif(sys.argv[1] == "skip"):
        wasp.quit_spotify()

    elif(sys.argv[1] == "info"):
        track = wasp.get_track()
        state = wasp.get_state()
        print(track["artist"])
        print(track["name"])
        print(track["album"])

        print(str(state["position"]) + "s")
    else:
        print("help msg here dont wanna do it now")
