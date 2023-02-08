## Render.com 🤝 Trigger.dev Quickstart

This repo is a great starting point to deploy your [Trigger.dev](https://trigger.dev) triggers to Render.com, if you don't already have a Node.js server to host your triggers.

[Render.com](https://render.com) is a super-fast way to deploy webapps and servers (think of it like a modern Heroku). Follow along with the directions below to deploy this repo as a [Background Worker](https://render.com/docs/background-workers) in your Render.com (or check out our full [Render.com Quickstart guide](https://docs.trigger.dev/quickstarts/render) for more info)

Currently this repo only has a single (very simple) trigger:

```ts
import { Trigger, customEvent } from "@trigger.dev/sdk";
import { z } from "zod";

new Trigger({
  id: "render-example",
  name: "Render Example",
  on: customEvent({
    name: "render.example",
    schema: z.object({ foo: z.string() }),
  }),
  async run(event, ctx) {
    await ctx.logger.info("Hello world from inside render");

    return event;
  },
}).listen();
```

## Run locally

First, clone the repo and install dependencies:

```sh
git clone https://github.com/triggerdotdev/render-deploy-example.git
cd render-deploy-example
npm install
```

Then create a `.env` file with your development Trigger.dev API Key:

```sh
echo "TRIGGER_API_KEY=trigger_development_dfSbP70wLueX" >> .env
```

And finally you are ready to run the process:

```sh
npm run dev
```

You should see a message like the following:

```
[trigger.dev]  ✨ Connected and listening for events [render-example]
```

## Deploy to Render.com

### Fork this repo

You'll first want to fork this repo into your own GitHub organization or user account so you'll be able to connect it with Render.com.

### Create a Background Worker

In your Render.com dashboard, create a new Background Worker and connect to the GitHub organization or user account you forked the repo in above.

Once you do that you'll be presented with the New Background Worker form, give it a name and keep everything the default except for 2 things:

1. Update the **Build Command** to be `npm install && npm run build` instead of `yarn`
2. Click on the "Advanced" button and add your live Trigger.dev API key as an environment variable

Finally, click the Deploy button and your Trigger.dev code should be deployed in less than a minute!

Check out our full [Render.com Quickstart guide](https://docs.trigger.dev/quickstarts/render) for more info.
