# ANZTest
The docker file has not been built using a multi stage build technique.

There are two stages in here. The one that starts the build is known as 'builder'.
The final stage is called 'final as it just takes the output from the first stage using --from=builder tag and copies relevant files.
It then exposes the port and provide the entrypoint

Results:

When the build was built using old dockerfile, the size of image came out to be 422 MB.

With the new optimised dockerfile, the size of the image came out to be 13.6 MB.

.dockerignore and .gitignore files also have been included to help with the optimisation.

The original build file also compile. I was able to use docker run and see the "Hello World" output on the web preview.





