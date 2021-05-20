import socket
import time

#print the hostname for every one minute
while True:
    print("I'm on %s" % socket.gethostname())
    time.sleep(10)
