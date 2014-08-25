Sputnik
=======

This runs the server component for Teradek's Bond video transmitters.


Usage
-----

Starting the server in the background:

    docker run -p 5111:5111 -p 1957:1957 --detach --name sputnik texastribune/sputnik

View the logs on a running server:

    docker attach sputnik


References
----------

* http://cdn.teradek.com/Public/Sputnik/Docs/Teradek_Sputnik_Setup_Guide_v2_0512.pdf
