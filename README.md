# zero-downtime

This is just an example app that shows how you can employ proper HEALTHCHECK in Dockerfile in order to achieve zero downtime deploys with CapRover.

In this extreme case, even though the image is fully unresponsive for 15sec (see entrypoint.sh). You will NOT see any 502 error pages when you deploy this app. That's because Docker swarm will keep this app silent until the HEALTHCHECK starts to pass.

To test:

- Create a new app (**no persistent data**)
- Go to deployment tab and enter these values,

```
Repository: github.com/githubsaturn/zero-downtime
Branch: main
Username: testing
Password: testing
```

- Then click on SAVE & UPDATE
- Finally click on FORCE BUILD.
- You will see that after the build is finished, the old place holder is being displayed for 15sec WITHOUT any 502 errors. But after 15sec, the app switches to the new image.
- Every time you click on FORCE BUILD, a new build gets deployed. It takes 15sec for that build to become responsive, but you should NOT see 502 errors.
