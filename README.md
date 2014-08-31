Teradek Sputnik
===============

This runs the server component for Teradek's Bond video transmitters.


Usage
-----

Here are some examples of how you could use this image. For more, see the
makefile.

### Starting a Sputnik server

    docker run -p 5111:5111 -p 1957:1957 -p 554:554 --detach --name sputnik \
      texastribune/sputnik

### View the logs on a running server

You can do this two ways. You can just attach to the server:

    docker attach --sig-proxy=false sputnik

Or you can mount the logs in a utility container:

    docker run --rm -i -t --name debug --link sputnik:sputnik --volumes-from sputnik ubuntu
    $ tail -f /var/log/sputnik*.log

### Use your own Sputnik configuration

1. Get the default Sputnik configuration. Skip this if you already have some
   config files.

        # assuming you want it copied to ~/volumes/sputnik and it already exists
        docker run --detach --name sputnik-tmp texastribune/sputnik
        docker cp sputnik-tmp:data/conf ~/volumes/sputnik
        docker rm -f sputnik-tmp

2. Run Sputnik using this configuration:

        docker run -p 5111:5111 -p 1957:1957 -p 554:554 --detach --name sputnik \
          -v ~/volumes/sputnik:/data texastribune/sputnik

3. Changes saved in the Sputnik admin will persist to your configs. You won't
   need to edit them yourself under normal circumstances. **NOTE:** Depending
   on how you run Sputnik, you should either edit ports in the config and use
   `--net=host`, or avoid editing ports and configure ports using Docker's port
   publishing.

4. Some suggested changes are: change admin and guest passwords, enable the
   stream monitor, and change the upload folder to `/data/upload`.


References
----------

* http://cdn.teradek.com/Public/Sputnik/Docs/Teradek_Sputnik_Setup_Guide_v2_0512.pdf
